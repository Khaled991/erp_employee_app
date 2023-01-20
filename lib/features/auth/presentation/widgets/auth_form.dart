import 'package:flutter/material.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/core/presentation/components/buttons/button.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/core/presentation/components/input/input.dart';
import 'package:erp_employee_app/core/utils/regex.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatelessWidget {
  final Widget? child;
  final double centerHeight;
  final VoidCallback onPressedSignIn;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const AuthForm(
      {Key? key,
      this.child,
      required this.centerHeight,
      required this.onPressedSignIn,
      required this.userNameController,
      required this.passwordController,
      required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.backgroundColor,
      height: centerHeight,
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.screen),
          child: Form(
            key: formKey,
            child: Gap(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              space: 20.0,
              children: [
                const Text(
                  "تسجيل الدخول",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primary,
                  ),
                ),
                const SizedBox(height: 40.0),
                Input(
                  controller: userNameController,
                  label: "اسم المستخدم",
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "من فضلك ادخل اسم المستخدم";
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(digitsRegExp),
                  ],
                ),
                Input(
                  controller: passwordController,
                  label: "كلمة المرور",
                  textInputAction: TextInputAction.done,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "كلمة السر مطلوبة";
                    }
                    return null;
                  },
                  obscureText: true,
                  onFieldSubmitted: (value) {
                    if (formKey.currentState?.validate() == true) {
                      formKey.currentState?.save();
                      onPressedSignIn();
                    }
                  },
                ),
                const SizedBox(height: 50.0),
                Button(
                  label: "تسجيل الدخول",
                  onPressed: onPressedSignIn,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
