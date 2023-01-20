import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/core/presentation/components/buttons/button.dart';
import 'package:flutter/material.dart';

class DateFilter extends StatelessWidget {
  final VoidCallback pickDateRange;

  const DateFilter({
    Key? key,
    required this.start,
    required this.end,
    required this.pickDateRange,
  }) : super(key: key);

  final DateTime start;
  final DateTime end;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'التاريخ',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
        const SizedBox(height: Paddings.medium),
        Button(
          label:
              'من : ${start.year}-${start.month}-${start.day} إلي : ${end.year}-${end.month}-${end.day}',
          onPressed: pickDateRange,
        ),
      ],
    );
  }
}
