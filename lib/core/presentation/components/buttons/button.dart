import 'package:erp_employee_app/core/config/theme/border_radius.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Color? color;
  final void Function() onPressed;
  final double height;
  final double? fontSize;

  const Button({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = ThemeColors.primary,
    this.height = 60,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiuses.large),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
