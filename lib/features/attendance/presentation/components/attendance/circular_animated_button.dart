import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/presentation/components/buttons/circular_button.dart';
import 'package:flutter/material.dart';

class CircularAnimatedButton extends StatefulWidget {
  final double radius;
  final Widget child;
  final void Function() onPressed;

  const CircularAnimatedButton({
    Key? key,
    required this.radius,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CircularAnimatedButton> createState() => _CircularAnimatedButtonState();
}

class _CircularAnimatedButtonState extends State<CircularAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationPadding;
  late Animation<double> _animationOpacity;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.repeat(reverse: true);

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationPadding = Tween<double>(
      begin: Paddings.medium,
      end: Paddings.large,
    ).animate(curvedAnimation);

    _animationOpacity = Tween<double>(
      begin: 0.3,
      end: 0.1,
    ).animate(curvedAnimation);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController.view,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(_animationPadding.value),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context)
                .primaryColor
                .withOpacity(_animationOpacity.value),
          ),
          child: child,
        );
      },
      child: CircularButton(
        onPressed: widget.onPressed,
        radius: widget.radius - 60,
        fillColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        child: widget.child,
      ),
    );
  }
}
