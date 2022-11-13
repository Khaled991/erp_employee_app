import 'package:erp_employee_app/core/constants/global_colors.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    Key? key,
    required this.bottomHeight,
  }) : super(key: key);

  final double bottomHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomHeight,
      color: GlobalColors.lightGrey,
    );
  }
}
