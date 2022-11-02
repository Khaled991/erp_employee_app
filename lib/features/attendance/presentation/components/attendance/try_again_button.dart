import 'package:flutter/material.dart';

import 'package:erp_employee_app/core/presentation/components/buttons/circular_button.dart';

class TryAgainButton extends StatelessWidget {
  final double radius;
  final VoidCallback onPressed;

  const TryAgainButton({
    Key? key,
    required this.radius,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      radius: radius,
      onPressed: onPressed,
      fillColor: Colors.white,
      splashColor: Colors.red.shade100,
      highlightColor: Colors.red.shade100,
      borderColor: Colors.red.shade400,
      child: const Icon(
        Icons.refresh,
        color: Colors.red,
        size: 100.0,
      ),
    );
  }
}
