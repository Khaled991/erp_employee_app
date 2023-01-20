import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class TileContent extends StatelessWidget {
  const TileContent({
    Key? key,
    required this.description,
    required this.seen,
    required this.date,
  }) : super(key: key);

  final String description;
  final bool seen;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: !seen ? FontWeight.w700 : FontWeight.w500,
              height: 1.5,
              color: ThemeColors.grey,
            ),
            maxLines: 2,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.start,
            overflow: TextOverflow.fade,
          ),
          Text(
            date,
            style: const TextStyle(
              color: ThemeColors.primary,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
