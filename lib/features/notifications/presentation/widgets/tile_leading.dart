import 'package:erp_employee_app/core/constants/global_colors.dart';
import 'package:flutter/material.dart';

class TileLeading extends StatelessWidget {
  final IconData leading;
  const TileLeading({
    Key? key,
    required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: CircleAvatar(
        backgroundColor: GlobalColors.primary,
        child: Icon(
          leading,
          size: 40.0,
          color: GlobalColors.white,
        ),
      ),
    );
  }
}
