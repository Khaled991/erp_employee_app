import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/features/notifications/data/enums/notification_tile_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationBottomSheet extends StatefulWidget {
  final NotificationTileType notificationTileType;
  final String stringDate;

  final String description;

  const NotificationBottomSheet({
    Key? key,
    required this.notificationTileType,
    required this.stringDate,
    required this.description,
  }) : super(key: key);

  @override
  State<NotificationBottomSheet> createState() =>
      _NotificationBottomSheetState();
}

class _NotificationBottomSheetState extends State<NotificationBottomSheet> {
  late final String title;
  late final String iconPath;

  @override
  void initState() {
    super.initState();
    _initializeTitleAndIconPath();
  }

  void _initializeTitleAndIconPath() {
    switch (widget.notificationTileType) {
      case NotificationTileType.notification:
        title = "تنبيه";
        iconPath = "assets/SVG/notifications.svg";
        break;
      case NotificationTileType.remainder:
        title = "تذكير";
        iconPath = "assets/SVG/remainder.svg";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
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
                  SvgPicture.asset(
                    iconPath,
                    color: primaryColor,
                    height: 25.0,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
              Text(
                widget.stringDate,
                style: TextStyle(
                  color: primaryColor,
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
