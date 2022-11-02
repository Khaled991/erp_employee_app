import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double radius;
  final Widget child;
  final void Function() onPressed;

  final Color? fillColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? borderColor;

  const CircularButton({
    Key? key,
    required this.radius,
    required this.child,
    required this.onPressed,
    this.fillColor,
    this.splashColor,
    this.highlightColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: fillColor,
        child: InkWell(
          splashColor: splashColor,
          highlightColor: highlightColor,
          onTap: onPressed,
          child: Container(
            decoration: borderColor != null
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(
                      color: borderColor ?? Theme.of(context).primaryColor,
                      width: 5.0,
                    ),
                  )
                : null,
            child: Padding(
              padding: const EdgeInsets.all(Paddings.small),
              child: SizedBox(
                width: radius,
                height: radius,
                child: Center(child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
