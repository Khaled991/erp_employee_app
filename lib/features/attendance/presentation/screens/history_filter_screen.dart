import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/presentation/components/buttons/button.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/core/widgets/custom_app_bar.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/filter/date_filter.dart';
import 'package:flutter/material.dart';

class HistoryFilterScreen extends StatefulWidget {
  final Widget? child;

  const HistoryFilterScreen({Key? key, this.child}) : super(key: key);

  @override
  State<HistoryFilterScreen> createState() => _HistoryFilterScreenState();
}

class _HistoryFilterScreenState extends State<HistoryFilterScreen> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;

    Future pickDateRange() async {
      DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
      if (newDateRange == null) return;

      setState(() {
        dateRange = newDateRange;
      });
    }

    void onPressedFilter() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'تصفية النتائج'),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.screen),
        child: Gap(
          space: Paddings.large,
          children: [
            DateFilter(
              start: start,
              end: end,
              pickDateRange: pickDateRange,
            ),
            Button(label: 'تصفية النتائج', onPressed: onPressedFilter)
          ],
        ),
      ),
    );
  }
}
