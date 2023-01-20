import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

void showAlertDialog({
  required BuildContext context,
  required String msg,
  required VoidCallback onPressedOk,
}) {
  Widget okButton = TextButton(
    onPressed: onPressedOk,
    child: const Text("نعم"),
  );
  Widget cancelButton = TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text("لا"),
  );

  AlertDialog alert = AlertDialog(
    alignment: Alignment.center,
    title: Row(
      children: const [
        Icon(
          Icons.report_problem_rounded,
          color: ThemeColors.primary,
          size: 25.0,
        ),
        SizedBox(width: Paddings.small),
        Text(
          "تنبية",
          style: TextStyle(
            color: ThemeColors.primary,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    content: Text(
      msg,
      style: const TextStyle(
        color: ThemeColors.primary,
        fontSize: 18.0,
      ),
    ),
    actions: [cancelButton, okButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
