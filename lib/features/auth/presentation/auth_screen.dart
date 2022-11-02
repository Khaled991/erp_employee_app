import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/core/config/theme/colors.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/presentation/components/buttons/button.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/core/presentation/components/input/input.dart';
import 'package:erp_employee_app/core/utils/regex.dart';
import 'package:erp_employee_app/core/utils/snackbar_utils.dart';
import 'package:erp_employee_app/features/auth/domain/providers/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController =
      //TODO:remove data
      TextEditingController(text: kDebugMode ? "username2" : null);
  final TextEditingController _passwordController =
      //TODO:remove data
      TextEditingController(text: kDebugMode ? "password1" : null);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double topHeight = screenHeight * 0.382;
    double bottomHeight = screenHeight * 0.618;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: screenHeight,
            child: ListView(
              children: [
                SizedBox(
                  height: topHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      80.0,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/SVG/logo.svg",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: bottomHeight,
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Paddings.screen),
                      child: Form(
                        key: _formKey,
                        child: Gap(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          space: 20.0,
                          children: [
                            Text(
                              "مرحباً بعودتك",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const SizedBox(height: 80.0),
                            Input(
                              controller: _userNameController,
                              label: "اسم المستخدم",
                              textInputAction: TextInputAction.next,
                              validator: (String? value) {
                                if (value?.isEmpty == true) {
                                  return "من فضلك ادخل اسم المستخدم";
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(digitsRegExp),
                              ],
                            ),
                            Input(
                              controller: _passwordController,
                              label: "كلمة المرور",
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value?.isEmpty == true) {
                                  return "كلمة السر مطلوبة";
                                }
                                return null;
                              },
                              obscureText: true,
                              onFieldSubmitted: (value) {
                                if (_formKey.currentState?.validate() == true) {
                                  _formKey.currentState?.save();
                                  _onPressedSignIn();
                                }
                              },
                            ),
                            const SizedBox(height: 50.0),
                            Button(
                              label: "تسجيل الدخول",
                              onPressed: _onPressedSignIn,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onPressedSignIn() {
    if (_formKey.currentState!.validate()) {
      final authProvider = context.read<AuthProvider>();

      authProvider
          .signIn(
        username: _userNameController.text,
        password: _passwordController.text,
      )
          .then((_) {
        switch (authProvider.userState.apiState) {
          case ApiState.ERROR:
            if (authProvider.userState.errorMessage != null) {
              showSnackBar(context, authProvider.userState.errorMessage!);
            }
            break;
          case ApiState.LOADED:
            Navigator.pushReplacement(context, Routes.home);
            break;
          default:
        }
      });
    }
  }
}
