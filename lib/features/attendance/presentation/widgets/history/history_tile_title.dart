import 'package:flutter/material.dart';

class HistoryTileTitle extends StatelessWidget {
  final String title;
  final Color color;

  const HistoryTileTitle({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: color,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}
