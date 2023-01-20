import 'package:flutter/material.dart';

class HistoryTileSideBar extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const HistoryTileSideBar({
    Key? key,
    required this.color,
    this.width = 5.0,
    this.height = 120.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: color,
      ),
      width: width,
      height: height,
    );
  }
}
