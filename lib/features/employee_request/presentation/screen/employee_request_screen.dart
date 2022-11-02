import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/domain/providers/root_provider.dart';
import 'package:erp_employee_app/core/presentation/components/buttons/button.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/core/presentation/components/input/input.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:erp_employee_app/core/utils/regex.dart';
import 'package:erp_employee_app/core/utils/snackbar_utils.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/dropdown/dropdown.dart';
import 'package:erp_employee_app/features/employee_request/data/enums/employee_request_type.dart';
import 'package:erp_employee_app/features/employee_request/domain/provider/employee_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EmployeeRequestScreen extends StatefulWidget {
  const EmployeeRequestScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeRequestScreen> createState() => _EmployeeRequestScreenState();
}

class _EmployeeRequestScreenState extends State<EmployeeRequestScreen> {
  EmployeeRequestType? requestType;
  final TextEditingController _customRequestTypeController =
      TextEditingController();
  final TextEditingController _requestDataController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final _employeeRequestProvider = context.read<EmployeeRequestProvider>();

  @override
  void initState() {
    super.initState();
    _employeeRequestProvider.addListener(() {
      final sendRequestState = _employeeRequestProvider.sendRequestState;
      switch (sendRequestState.apiState) {
        case ApiState.ERROR:
          showSnackBar(context, sendRequestState.errorMessage!);
          break;
        case ApiState.LOADED:
          _requestDataController.clear();
          _customRequestTypeController.clear();
          showSnackBar(
            context,
            "تم إرسال الطلب بنجاح",
            snackBarType: SnackBarType.success,
          );
          break;
        default:
      }

      if (sendRequestState.apiState == ApiState.LOADING) {
        context.read<RootProvider>().loading = true;
      } else {
        context.read<RootProvider>().loading = false;
      }
    });
  }

  @override
  void dispose() {
    _customRequestTypeController.dispose();
    _requestDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(Paddings.screen),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Gap(
            space: 25.0,
            children: [
              SvgPicture.asset(
                'assets/SVG/add-requist.svg',
                width: screenSize.width * .8,
              ),
              Dropdown<EmployeeRequestType>(
                label: "نوع الطلب",
                validator: _validateDropdown,
                onChanged: onTypeChanged,
                items: EmployeeRequestType.values
                    .map<DropdownMenuItem<EmployeeRequestType>>(
                        (EmployeeRequestType requestType) {
                  return DropdownMenuItem<EmployeeRequestType>(
                    value: requestType,
                    child: Text(_requestTypeString[requestType]!),
                  );
                }).toList(),
                value: requestType,
              ),
              if (requestType == EmployeeRequestType.OTHER)
                Input(
                  controller: _customRequestTypeController,
                  label: "النوع",
                  validator: (String? value) =>
                      _validateInput(value, requiredFieldNameOnError: "النوع"),
                ),
              if (requestType != null) _renderRequestInput[requestType]!,
              Button(
                label: "ارسال الطلب",
                onPressed: _onPressedSend,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTypeChanged(EmployeeRequestType? newRequestType) {
    setState(() {
      requestType = newRequestType!;
      _requestDataController.clear();
    });
  }

  Map<EmployeeRequestType, String> get _requestTypeString => {
        EmployeeRequestType.LOAN: "سلفة",
        EmployeeRequestType.VACATION: "إجازة",
        EmployeeRequestType.LEAVING: "مغادرة",
        EmployeeRequestType.OTHER: "آخر",
      };

  Map<EmployeeRequestType, Input> get _renderRequestInput => {
        EmployeeRequestType.LOAN: Input(
          controller: _requestDataController,
          label: "قيمة السلفة",
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(digitsAndPointRegExp),
            CurrencyTextInputFormatter(symbol: ""),
          ],
          validator: (String? value) =>
              _validateInput(value, requiredFieldNameOnError: "قيمة السلفة"),
        ),
        EmployeeRequestType.VACATION: Input(
          controller: _requestDataController,
          label: "مدة الإجازة (عدد الأيام)",
          inputFormatters: [
            FilteringTextInputFormatter.allow(digitsRegExp),
          ],
          validator: (String? value) =>
              _validateInput(value, requiredFieldNameOnError: "مدة الإجازة"),
        ),
        EmployeeRequestType.LEAVING: Input(
          controller: _requestDataController,
          label: "السبب",
          maxLines: null,
          validator: (String? value) =>
              _validateInput(value, requiredFieldNameOnError: "السبب"),
        ),
        EmployeeRequestType.OTHER: Input(
          controller: _requestDataController,
          label: "السبب",
          maxLines: null,
          validator: (String? value) =>
              _validateInput(value, requiredFieldNameOnError: "السبب"),
        ),
      };

  String? _validateDropdown(EmployeeRequestType? employeeRequestType) {
    if (employeeRequestType == null) {
      return 'من فضلك أختر نوع الطلب';
    }
    return null;
  }

  String? _validateInput(String? value,
      {required String requiredFieldNameOnError}) {
    if (value == null || value.isEmpty) {
      return "من فضلك اكتب $requiredFieldNameOnError";
    }
    return null;
  }

  void _onPressedSend() {
    if (_formKey.currentState!.validate()) {
      final String type =
          requestType != null && requestType != EmployeeRequestType.OTHER
              ? requestType!.name
              : _customRequestTypeController.text;

      _employeeRequestProvider
          .sendRequest(type: type, data: _requestDataController.text)
          .then((_) => reset());
    }
  }

  void reset() {
    setState(() {
      requestType = null;
      _requestDataController.clear();
      _customRequestTypeController.clear();
    });
  }
}
