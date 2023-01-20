import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 60.0;
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color textColor;
  final double titleSize;

  @override
  Size get preferredSize => Size(double.infinity, appBarHeight);
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backgroundColor = Colors.transparent,
    this.textColor = ThemeColors.primary,
    this.titleSize = 25.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        iconTheme: const IconThemeData(
          color: ThemeColors.primary, //change your color here
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        actions: actions,
      ),
    );
  }
}
