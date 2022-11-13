import 'package:erp_employee_app/core/constants/global_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 60.0;
  final String title;
  final List<Widget>? actions;
  @override
  Size get preferredSize => Size(double.infinity, appBarHeight);

  const CustomAppBar({Key? key, required this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: GlobalColors.primary,
          ),
        ),
        actions: actions,
      ),
    );
  }
}
