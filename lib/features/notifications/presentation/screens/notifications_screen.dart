import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/features/notifications/data/enums/notification_tile_type.dart';
import 'package:erp_employee_app/features/notifications/domain/providers/hr_message_provider.dart';
import 'package:erp_employee_app/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<HrMessagesProvider>().findAll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hrMessagesProvider = context.watch<HrMessagesProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: Paddings.screen),
        child: Gap(
            children: hrMessagesProvider.listState.data
                .map(
                  (hrMessage) => HrMessageTile(
                    seen: hrMessage.seen,
                    notificationTileType: NotificationTileType.notification,
                    description: hrMessage.message,
                  ),
                )
                .toList()
            // [

            //   ,
            //   HrMessageTile(
            //     isSeen: false,
            //     notificationTileType: NotificationTileType.remainder,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: false,
            //     notificationTileType: NotificationTileType.remainder,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.notification,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: false,
            //     notificationTileType: NotificationTileType.notification,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.remainder,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.notification,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.remainder,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.notification,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.remainder,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.remainder,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.notification,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.notification,
            //     description: loremIpsum,
            //   ),
            //   HrMessageTile(
            //     isSeen: true,
            //     notificationTileType: NotificationTileType.remainder,
            //     description: loremIpsum,
            //   ),
            // ],
            ),
      ),
    );
  }
}
