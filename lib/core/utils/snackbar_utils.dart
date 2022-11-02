import 'package:flutter/material.dart';

enum SnackBarType {
  error,
  success,
  warning,
  info,
}

void showSnackBar(BuildContext context, String msg,
    {SnackBarType snackBarType = SnackBarType.error}) {
  late Color color;

  switch (snackBarType) {
    case SnackBarType.error:
      color = Colors.red.withOpacity(0.75);
      break;
    case SnackBarType.success:
      color = Colors.green.withOpacity(0.75);
      break;
    case SnackBarType.warning:
      color = Colors.orange.withOpacity(0.75);
      break;
    case SnackBarType.info:
      color = Theme.of(context).primaryColor.withOpacity(0.75);
      break;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
      ),
      margin: const EdgeInsets.only(bottom: 30.0),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
    ),
  );
}
