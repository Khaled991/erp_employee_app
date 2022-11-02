// import 'package:erp_employee_app/core/presentation/screens/infinite_scroll_screen/screen_layout.dart';
// import 'package:erp_employee_app/features/attendance/presentation/components/history/tab_bar/tab_bar_months.dart';
// import 'package:erp_employee_app/features/attendance/presentation/components/history/tab_bar/tab_bar_years.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider/single_child_widget.dart';

// class InfiniteScrollScreen<T> extends StatefulWidget {
//   final List<SingleChildWidget> providers;
//   final String title;

//   final Widget addButtonScreen;
//   final Widget Function(T elementTitle) listTile;

//   const InfiniteScrollScreen({
//     Key? key,
//     required this.providers,
//     required this.title,
//     required this.addButtonScreen,
//     required this.listTile,
//   }) : super(key: key);

//   @override
//   State<InfiniteScrollScreen<T>> createState() =>
//       _InfiniteScrollScreenState<T>();
// }

// class _InfiniteScrollScreenState<T> extends State<InfiniteScrollScreen<T>>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: widget.providers,
//       builder: (BuildContext context, _) {
//         return ScreenLayout(
//           body: Column(
//             children: [
//               TabBarYears(
//                 vsync: this,
//                 yearLimit: Limit(start: 2018, end: 2022),
//                 onTap: (List<String> years, int index) {
//                   print(years[index]);
//                 },
//               ),
//               TabBarMonths(
//                 vsync: this,
//                 monthLimit: Limit(start: 1, end: 12),
//                 onTap: (List<String> months, int index) {
//                   print(months[index]);
//                 },
//                 // endMonth: 5,
//                 // startMonth: 9,
//               ),
//               // Expanded(
//               //   child: InfiniteScroll<T>(
//               //     provider: context.watch<TableWithFilterProvider<T>>(),
//               //     buildScrollListTile: (T elementTitle, _) {
//               //       return widget.listTile(elementTitle);
//               //     },
//               //   ),
//               // ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
