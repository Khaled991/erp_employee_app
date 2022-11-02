import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/features/auth/data/models/user.dart';
import 'package:erp_employee_app/features/auth/domain/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      final AuthProvider authProvider = context.read<AuthProvider>();
      final User? user = authProvider.getSavedUser();

      //TODO: remove next line
      return Navigator.of(context).pushReplacement(Routes.home);

      if (user != null) {
        authProvider.setUserState((state) => state.copyWith(data: user));

        Navigator.of(context).pushReplacement(Routes.home);
      } else {
        Navigator.of(context).pushReplacement(Routes.auth);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //TODO: implement splash screen
      body: Text("Splash Screen"),
    );
  }
}
