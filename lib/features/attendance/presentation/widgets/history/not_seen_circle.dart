import 'package:flutter/material.dart';

class NotSeenCircle extends StatelessWidget {
  const NotSeenCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      width: 10.0,
      height: 10.0,
    );
  }
}
