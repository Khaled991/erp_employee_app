import 'package:flutter/material.dart';

class TabBarC extends StatelessWidget {
  final TickerProvider vsync;
  final List<String> tabsTitles;
  final void Function(List<String> tabsTitles, int index) onTap;

  const TabBarC({
    Key? key,
    required this.vsync,
    required this.tabsTitles,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(30.0),
      child: TabBar(
        controller: TabController(
          length: tabsTitles.length,
          vsync: vsync,
        ),
        isScrollable: true,
        onTap: (int index) {
          onTap(tabsTitles, index);
        },
        unselectedLabelColor: Colors.grey.shade50,
        labelColor: Theme.of(context).primaryColor,
        tabs: tabsTitles.map((String tabTitle) {
          return Tab(
            child: Text(tabTitle),
          );
        }).toList(),
      ),
    );
  }
}
