import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/core/presentation/components/icon_with_badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../features/auth/domain/providers/auth_provider.dart';
import '../config/routes.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int index;
  final void Function(int) setIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.index,
    required this.setIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    // final hrMessagesProvider = context.watch<HrMessagesProvider>();

    void logout() {
      context.read<AuthProvider>().signOut().then(
            (_) => Navigator.pushReplacement(context, Routes.auth),
          );
    }

    void handleTap(int index) {
      const logoutIndex = 3;
      switch (index) {
        case logoutIndex:
          logout();
          break;
        default:
          widget.setIndex(index);
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 35.0,
        right: 35.0,
        bottom: 35.0,
        top: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SalomonBottomBar(
          currentIndex: widget.index,
          onTap: handleTap,
          itemPadding: const EdgeInsets.all(14.0),
          unselectedItemColor: ThemeColors.white,
          selectedItemColor: ThemeColors.white,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(size: 30.0, Icons.person_rounded),
              title: const Text(
                "الحضور",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Cairo',
                ),
              ),
            ),

            /// Add requist
            SalomonBottomBarItem(
              icon: const Icon(
                size: 30.0,
                Icons.email_rounded,
              ),
              title: const Text(
                "اضافة طلب",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Cairo',
                ),
              ),
            ),

            /// Notifications
            SalomonBottomBarItem(
              icon: const IconWithBadge(
                count: 2,
                icon: Icons.notifications_rounded,
                showBadge: true,
              ),
              title: const Text(
                'الاشعارات',
                style: TextStyle(
                  height: 1.5,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Cairo',
                ),
              ),
            ),

            /// Log out
            SalomonBottomBarItem(
              icon: const Icon(size: 30.0, Icons.logout_rounded),
              title: const Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
