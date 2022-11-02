import 'package:erp_employee_app/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';

import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:flutter/scheduler.dart';

class ApiRenderer extends StatelessWidget {
  final ApiState apiState;
  final Widget loadingWidget;
  final Widget? errorWidget;
  final Widget loadedWidget;
  final Widget idleWidget;
  final String? errorMessage;

  const ApiRenderer({
    Key? key,
    required this.idleWidget,
    this.loadingWidget = const Center(child: CircularProgressIndicator()),
    required this.loadedWidget,
    required this.apiState,
    this.errorWidget,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (errorMessage != null) {
        showSnackBar(context, errorMessage!);
      }
    });
    switch (apiState) {
      case ApiState.IDLE:
        return idleWidget;
      case ApiState.LOADING:
        return loadingWidget;
      case ApiState.LOADED:
        return loadedWidget;
      case ApiState.ERROR:
        return errorWidget ?? loadedWidget;
    }
  }
}
