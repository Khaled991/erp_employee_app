import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/core/presentation/components/icon_with_badge.dart';
import 'package:erp_employee_app/core/widgets/custom_app_bar.dart';
import 'package:erp_employee_app/features/notifications/data/enums/notification_tile_type.dart';
import 'package:erp_employee_app/features/notifications/domain/providers/hr_message_provider.dart';
import 'package:erp_employee_app/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:erp_employee_app/features/privacy_and_security/privacy_and_security_screen.dart';
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
      appBar: CustomAppBar(
        title: 'الاشعارات',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, Routes.notificatioFilters);
            },
            icon: const IconWithBadge(
              icon: Icons.filter_alt_rounded,
              iconColor: ThemeColors.primary,
              showBadge: true,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: Paddings.screen,
            horizontal: Paddings.small,
          ),
          child: Column(
            children: const [
              HrMessageTile(
                notificationTileType: NotificationTileType.remainder,
                description: 'safsafasffafffaf',
                seen: false,
                date: "22-5-2022",
              ),
              SizedBox(height: Paddings.large),
              HrMessageTile(
                notificationTileType: NotificationTileType.notification,
                description:
                    'hello worldsssssssssssssssssssssssssslh;k;h;ougouoihohsdsadasdsadsaworldsssssssssssssssssssssssssslhworldsssssssssssssssssssssssssslhworldsssssssssssssssssssssssssslhworldsssssssssssssssssssssssssslh worldsssssssssssssssssssssssssslh',
                seen: true,
                date: "22-5-2022",
              ),
            ],
          )
          //TODO: remove the column above and uncoment the Gap widget
          // Gap(
          //     children: hrMessagesProvider.listState.data
          //         .map(
          //           (hrMessage) => HrMessageTile(
          //             seen: hrMessage.seen,
          //             notificationTileType: NotificationTileType.notification,
          //             description: hrMessage.message,
          //           ),
          //         )
          //         .toList()
          //     ),
          ),
    );
  }
}
