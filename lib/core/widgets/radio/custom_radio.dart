import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  final Widget? child;
  final String title;
  final T value;
  final T activeValue;
  final void Function(T?) onChanged;

  const CustomRadio({
    Key? key,
    this.child,
    required this.title,
    required this.onChanged,
    required this.value,
    required this.activeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      activeColor: ThemeColors.primary,
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
      value: value,
      groupValue: activeValue,
      onChanged: onChanged,
    );
  }
}
