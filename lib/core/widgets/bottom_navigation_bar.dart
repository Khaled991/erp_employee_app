import 'package:badges/badges.dart';
import 'package:erp_employee_app/core/constants/global_colors.dart';
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
    void logout() {
      context.read<AuthProvider>().signOut().then(
            (_) => Navigator.pushReplacement(context, Routes.auth),
          );
    }

    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Container(
        decoration: BoxDecoration(
          color: GlobalColors.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SalomonBottomBar(
          currentIndex: widget.index,
          onTap: widget.setIndex,
          itemPadding: const EdgeInsets.all(14.0),
          unselectedItemColor: GlobalColors.white,
          selectedItemColor: GlobalColors.white,
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
              icon: Badge(
                badgeColor: Colors.red,
                animationType: BadgeAnimationType.scale,
                animationDuration: const Duration(milliseconds: 900),
                position: const BadgePosition(start: 14.0, top: -2.0),
                showBadge: true,
                badgeContent: const Text('4'),
                child: const Icon(
                  size: 30.0,
                  Icons.notifications_rounded,
                  textDirection: TextDirection.rtl,
                ),
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
              icon: GestureDetector(
                onTap: logout,
                child: const Icon(size: 30.0, Icons.logout_rounded),
              ),
              title: const Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
