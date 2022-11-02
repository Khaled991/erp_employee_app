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
    return SvgPicture.asset(
      getTimeBadgePath(),
      width: badgeSize,
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
