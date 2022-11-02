import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double? space;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final List<Widget?> children;
  final bool isRow;
  final bool debug;
  const Gap({
    Key? key,
    this.space = 10.0,
    required this.children,
    this.isRow = false,
    this.debug = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  const Gap.row({
    Key? key,
    this.space = 10,
    required this.children,
    this.debug = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  })  : isRow = true,
        super(key: key);

  List<Widget> _withSpacing() {
    final List<Widget> list = [];
    for (var i = 0; i < children.length; i++) {
      var child = children[i];
      if (child == null) continue;
      if (i != 0 && isAddSpace(child, i)) {
        list.add(isRow ? SizedBox(width: space) : SizedBox(height: space));
      }
      list.add(child);
    }
    return list;
  }

  bool isAddSpace(Widget? child, int i) {
    if (child is SizedBox || (i > 0 && children[i - 1] is SizedBox)) {
      return false;
    }
    return true;
  }

  List<Widget> childrenWithoutNull() {
    final List<Widget> list = [];
    for (var child in children) {
      if (child == null) continue;
      list.add(child);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    late Widget child;

    if (isRow) {
      child = Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: _withSpacing(),
      );
    } else {
      child = Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: _withSpacing(),
      );
    }
    return child;
  }
}
