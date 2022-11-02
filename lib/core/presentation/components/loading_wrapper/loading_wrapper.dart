import 'package:flutter/material.dart';

class LoadingWrapper extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingWrapper({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
            ),
            // width: size.width,
            // height: size.height,
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
