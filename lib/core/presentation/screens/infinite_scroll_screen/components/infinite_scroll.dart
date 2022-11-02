import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/domain/providers/provider_with_list_paginated.dart';
import 'package:erp_employee_app/core/presentation/screens/infinite_scroll_screen/components/no_results_found.dart';
import 'package:flutter/material.dart';

class InfiniteScroll<T> extends StatefulWidget {
  final Widget Function(T, int) buildScrollListTile;
  final int pageItemsCount;
  final ProviderWithListPaginated<T> provider;
  final List<T>? elements;
  final List<T>? additionalElements;
  final Widget? noResultsFoundWidget;
  final double? maxHeight;

  const InfiniteScroll({
    Key? key,
    required this.buildScrollListTile,
    this.pageItemsCount = 15,
    required this.provider,
    this.elements,
    this.additionalElements = const [],
    this.noResultsFoundWidget,
    this.maxHeight,
  }) : super(key: key);

  @override
  State<InfiniteScroll<T>> createState() => _InfiniteScrollState<T>();
}

class _InfiniteScrollState<T> extends State<InfiniteScroll<T>> {
  Future<void> _onRefresh() async {
    await widget.provider.findAll();
  }

  @override
  Widget build(BuildContext context) {
    final tableProvider = widget.provider;

    final bool isLoading = tableProvider.listState.data.isEmpty &&
        tableProvider.listState.apiState != ApiState.LOADED;

    List<T> elements = [
      ...widget.additionalElements!,
      ...(widget.elements ?? tableProvider.listState.data)
    ];

    final bool noResultsFound =
        elements.isEmpty && tableProvider.listState.apiState != ApiState.LOADED;

    final Color primaryColor = Theme.of(context).primaryColor;

    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: primaryColor,
      child: LayoutBuilder(builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        if (isLoading) {
          ListView(
            shrinkWrap: true,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: RenderInExpandedIfNoMaxHeight(
                  child: const Center(
                    heightFactor: 1,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          );
        } else if (noResultsFound) {
          return LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints constraint,
            ) {
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  widget.noResultsFoundWidget ??
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: const NoResultsFound(),
                      ),
                ],
              );
            },
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RenderInExpandedIfNoMaxHeight(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: elements.length,
                itemBuilder: (BuildContext context, int index) {
                  T element = elements[index];

                  handleScrollWithIndex(index);

                  return widget.buildScrollListTile(element, index);
                },
              ),
            ),
            if (tableProvider.listState.apiState == ApiState.LOADING)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      }),
    );
  }

  // ignore: non_constant_identifier_names
  Widget RenderInExpandedIfNoMaxHeight({required Widget child}) {
    if (widget.maxHeight != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: widget.maxHeight! - 200),
        child: child,
      );
    } else {
      return Expanded(
        child: child,
      );
    }
  }

  void handleScrollWithIndex(int index) {
    // final int itemPosition = index + 1;
    // final bool requestMoreData =
    //     itemPosition % widget.pageItemsCount == 0 && itemPosition != 0;
    // final int pageToRequest = (itemPosition ~/ widget.pageItemsCount) + 1;

    //TODO:handle load more
    // if (requestMoreData && pageToRequest > widget.provider.listState.page) {
    //   widget.provider.findAll().then(
    //         (_) => setState(() {}),
    //       );
    // }
  }
}
