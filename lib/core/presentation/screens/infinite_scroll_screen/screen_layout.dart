import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final Widget body;
  const ScreenLayout({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(Paddings.screen),
      child: body,
    ));
  }
}
