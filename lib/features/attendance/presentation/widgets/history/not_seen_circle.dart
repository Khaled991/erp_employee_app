import 'package:erp_employee_app/core/constants/global_colors.dart';
import 'package:flutter/material.dart';

class NotSeenCircle extends StatelessWidget {
  const NotSeenCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: GlobalColors.primary,
      ),
      width: 8.0,
      height: 8.0,
    );
  }
}
