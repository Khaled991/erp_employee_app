import 'package:erp_employee_app/core/domain/providers/root_provider.dart';
import 'package:erp_employee_app/features/auth/domain/providers/auth_provider.dart';
import 'package:erp_employee_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart';

void main() async {
  await injectionInit();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RootProvider>(
          create: (_) => RootProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => serviceLocator(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
