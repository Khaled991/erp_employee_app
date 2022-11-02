import 'package:erp_employee_app/core/config/theme/border_radius.dart';
import 'package:erp_employee_app/core/config/theme/colors.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/constants/delete_me.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/rounded_bottom_sheet.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/history/history_widgets.dart';
import 'package:erp_employee_app/features/notifications/data/enums/notification_tile_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HrMessageTile extends StatelessWidget {
  final bool seen;

  final NotificationTileType notificationTileType;

  final String description;

  const HrMessageTile({
    Key? key,
    required this.seen,
    required this.notificationTileType,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showRoundedBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return NotificationBottomSheet(
              notificationTileType: notificationTileType,
              //TODO: handle date here and below
              stringDate: "22-5-2022",
              description: description,
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: border,
          ),
          borderRadius: BorderRadius.circular(BorderRadiuses.small),
        ),
        width: double.infinity,
        height: 86.0,
        child: Padding(
          padding: const EdgeInsets.all(Paddings.small),
          child: Gap(
            isRow: true,
            children: [
              SvgPicture.asset(
                _getLeadingIconPath(),
                height: 60.0,
                width: 60.0,
              ),
              Expanded(
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
                      ),
                      maxLines: 2,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.fade,
                    ),
                    const Text(
                      "22-5-2022",
                      style: TextStyle(
                        color: ColorPalette.primary,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (!seen) const NotSeenCircle()
            ],
          ),
        ),
      ),
    );
  }

  String _getLeadingIconPath() {
    late String leadingIconPath;
    switch (notificationTileType) {
      case NotificationTileType.notification:
        leadingIconPath = 'assets/SVG/notification_background.svg';
        break;
      case NotificationTileType.remainder:
        leadingIconPath = 'assets/SVG/remainder_background.svg';
        break;
    }

    return leadingIconPath;
  }
}
