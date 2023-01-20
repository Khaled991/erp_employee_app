import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/core/presentation/components/loading_wrapper/loading_wrapper.dart';
import 'package:erp_employee_app/features/auth/data/models/user.dart';
import 'package:erp_employee_app/features/auth/domain/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Scaffold(
      backgroundColor: ThemeColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/SVG/logo.svg',
              width: 110.0,
              height: 110.0,
            ),
            const SizedBox(height: 40.0),
            const CircularProgressIndicator(color: ThemeColors.white),
          ],
        ),
      ),
    );
  }
}
