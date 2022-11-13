import 'package:erp_employee_app/core/config/routes.dart';

import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/utils/snackbar_utils.dart';
import 'package:erp_employee_app/features/auth/domain/providers/auth_provider.dart';
import 'package:erp_employee_app/features/auth/presentation/widgets/auth_footer.dart';
import 'package:erp_employee_app/features/auth/presentation/widgets/auth_form.dart';
import 'package:erp_employee_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController =
      //TODO:remove data
      TextEditingController(text: kDebugMode ? "username2" : null);
  final TextEditingController _passwordController =
      //TODO:remove data
      TextEditingController(text: kDebugMode ? "password1" : null);

  void onPressedSignIn() {
    if (_formKey.currentState!.validate()) {
      final authProvider = context.read<AuthProvider>();

      authProvider
          .signIn(
        username: _userNameController.text,
        password: _passwordController.text,
      )
          .then((_) {
        switch (authProvider.userState.apiState) {
          case ApiState.ERROR:
            if (authProvider.userState.errorMessage != null) {
              showSnackBar(context, authProvider.userState.errorMessage!);
            }
            break;
          case ApiState.LOADED:
            Navigator.pushReplacement(context, Routes.home);
            break;
          default:
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double topHeight = screenHeight * 0.430;
    double centerHeight = screenHeight * 0.500;
    double bottomHeight = screenHeight * 0.70;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            height: screenHeight,
            child: ListView(
              children: [
                AuthHeader(topHeight: topHeight),
                AuthForm(
                  centerHeight: centerHeight,
                  onPressedSignIn: onPressedSignIn,
                  userNameController: _userNameController,
                  passwordController: _passwordController,
                  formKey: _formKey,
                ),
                AuthFooter(bottomHeight: bottomHeight),
              ],
            ),
          )
        ],
      ),
    );
  }
}
