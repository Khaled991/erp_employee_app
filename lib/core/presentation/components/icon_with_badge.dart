import 'package:badges/badges.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class IconWithBadge extends StatelessWidget {
  final bool showBadge;
  final int? count;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;

  const IconWithBadge({
    Key? key,
    required this.showBadge,
    this.count,
    this.iconSize = 30.0,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: Colors.red,
      animationType: BadgeAnimationType.scale,
      animationDuration: const Duration(milliseconds: 900),
      position: BadgePosition(start: 14.0, top: count != null ? -16.0 : 0),
      showBadge: showBadge,
      badgeContent: showBadge && count != null
          ? Text(
              count.toString(),
              style: const TextStyle(color: ThemeColors.primary),
            )
          : null,
      child: Icon(
        size: iconSize,
        icon,
        textDirection: TextDirection.rtl,
        color: iconColor,
      ),
    );
  }
}
