import 'package:erp_employee_app/core/config/theme/border_radius.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/rounded_bottom_sheet.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/history/history_widgets.dart';
import 'package:erp_employee_app/features/notifications/data/enums/notification_tile_type.dart';
import 'package:erp_employee_app/features/notifications/presentation/widgets/tile_content.dart';
import 'package:erp_employee_app/features/notifications/presentation/widgets/tile_leading.dart';
import 'package:flutter/material.dart';

class HrMessageTile extends StatelessWidget {
  final bool seen;
  final NotificationTileType notificationTileType;
  final String description;
  final String date;

  const HrMessageTile({
    Key? key,
    required this.seen,
    required this.notificationTileType,
    required this.description,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData getLeadingIcon() {
      late IconData leadingIcon;
      switch (notificationTileType) {
        case NotificationTileType.notification:
          leadingIcon = Icons.notifications_rounded;
          break;
        case NotificationTileType.remainder:
          leadingIcon = Icons.timer_rounded;
          break;
      }
      return leadingIcon;
    }

    return GestureDetector(
      onTap: () {
        showRoundedBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return NotificationBottomSheet(
              notificationTileType: notificationTileType,
              //TODO: handle date here and below
              date: date,
              description: description,
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(BorderRadiuses.small),
        ),
        width: double.infinity,
        height: 95.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Paddings.medium,
            vertical: Paddings.small,
          ),
          child: Gap(
            isRow: true,
            children: [
              TileLeading(leading: getLeadingIcon()),
              const SizedBox(width: Paddings.small),
              TileContent(description: description, seen: seen, date: date),
              if (!seen) const NotSeenCircle()
            ],
          ),
        ),
      ),
    );
  }
}
