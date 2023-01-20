import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  final Widget? child;

  const PrivacyAndSecurityScreen({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'الخصوصية والأمان'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Paddings.screen),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Text('الخصوصية والأمان'),
          ),
        ),
      ),
    );
  }
}
