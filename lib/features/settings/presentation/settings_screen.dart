import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/features/auth/domain/providers/auth_provider.dart';
import 'package:erp_employee_app/features/settings/presentation/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Paddings.screen),
      child: Gap(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 50.0,
            child: const Center(
              child: Text(
                "أ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  height: 2,
                ),
              ),
            ),
          ),
          const Text(
            "أحمد وليد",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          const SizedBox(height: 30.0),
          SettingsTile(
            title: "الخصوصية والأمان",
            iconPath: "assets/SVG/notification_background.svg",
            onTap: () {
              print("Privacy and security");
            },
          ),
          SettingsTile(
            title: "تسجيل الخروج",
            iconPath: "assets/SVG/sign_out_background.svg",
            onTap: () {
              context
                  .read<AuthProvider>()
                  .signOut()
                  .then((_) => Navigator.pushReplacement(context, Routes.auth));
            },
          ),
        ],
      ),
    );
  }
}
