import 'package:erp_employee_app/core/config/theme/paddings.dart';
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
      padding: const EdgeInsets.all(Paddings.large),
      child: Container(
        decoration: BoxDecoration(
          color: GlobalColors.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SalomonBottomBar(
          currentIndex: widget.index,
          onTap: widget.setIndex,
          itemPadding: const EdgeInsets.all(14.0),
          // selectedColorOpacity: 1,
          unselectedItemColor: GlobalColors.white,
          selectedItemColor: GlobalColors.white,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_outlined),
              title: const Text(
                "الحضور",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            /// Add requist
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.email_outlined,
              ),
              title: const Text(
                "اضافة طلب",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            /// Notifications
            SalomonBottomBarItem(
              icon: const Icon(Icons.notifications_outlined),
              title: const Text(
                "الاشعارات",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            /// Log out
            SalomonBottomBarItem(
              icon: GestureDetector(
                onTap: logout,
                child: const Icon(Icons.logout_outlined),
              ),
              title: const Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
