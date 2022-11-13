import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/constants/global_colors.dart';
import 'package:erp_employee_app/features/notifications/data/enums/notification_tile_type.dart';
import 'package:flutter/material.dart';

class NotificationBottomSheet extends StatefulWidget {
  final NotificationTileType notificationTileType;
  final String date;

  final String description;

  const NotificationBottomSheet({
    Key? key,
    required this.notificationTileType,
    required this.date,
    required this.description,
  }) : super(key: key);

  @override
  State<NotificationBottomSheet> createState() =>
      _NotificationBottomSheetState();
}

class _NotificationBottomSheetState extends State<NotificationBottomSheet> {
  late final String title;
  late final IconData icon;

  @override
  void initState() {
    super.initState();
    _initializeTitleAndIconPath();
  }

  void _initializeTitleAndIconPath() {
    switch (widget.notificationTileType) {
      case NotificationTileType.notification:
        title = "تنبيه";
        icon = Icons.notifications_rounded;
        break;
      case NotificationTileType.remainder:
        title = "تذكير";
        icon = Icons.timer_rounded;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Paddings.small,
        horizontal: Paddings.screen,
      ),
      child: Column(
        children: [
          Container(
            width: 150.0,
            height: 2.5,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(200.0),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 30.0,
                    color: GlobalColors.primary,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: GlobalColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                widget.date,
                style: const TextStyle(
                  color: GlobalColors.primary,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
