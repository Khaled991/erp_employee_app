import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum TimeBadgeType {
  earlier,
  overtime,
}

class TimeBadge extends StatelessWidget {
  final TimeBadgeType timeBadgeType;
  final double badgeSize;

  const TimeBadge({
    Key? key,
    required this.timeBadgeType,
    this.badgeSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final badgeColor = timeBadgeType == TimeBadgeType.earlier
        ? ThemeColors.red
        : ThemeColors.green;
    return Container(
      // width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: badgeColor.withOpacity(0.075),
        border: Border.all(
          width: .5,
          color: badgeColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Paddings.small),
        child: Row(
          children: [
            SvgPicture.asset(
              getTimeBadgePath(),
              width: badgeSize,
            ),
            const SizedBox(width: Paddings.small),
            Text(
              timeBadgeType == TimeBadgeType.earlier
                  ? 'وقت متأخر'
                  : 'وقت إضافي',
              style: TextStyle(
                color: badgeColor,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTimeBadgePath() {
    switch (timeBadgeType) {
      case TimeBadgeType.earlier:
        return "assets/SVG/earlier.svg";
      case TimeBadgeType.overtime:
        return "assets/SVG/overtime.svg";
    }
  }
}
