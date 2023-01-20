import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/data/entities/duration_limits/duration_limits.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/provider_state.dart';
import 'package:erp_employee_app/core/domain/providers/provider_with_list_paginated.dart';

import 'package:erp_employee_app/core/utils/list_utils.dart';
import 'package:erp_employee_app/core/utils/show_alert_dialog.dart';
import 'package:erp_employee_app/core/utils/snackbar_utils.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/domain/repository/attendance_repository.dart';
import 'package:erp_employee_app/features/employee_request/data/enums/employee_request_type.dart';
import 'package:flutter/material.dart';

class AttendanceProvider extends ProviderWithListPaginated<Attendance> {
  final AttendanceRepository _attendanceRepository;
  ProviderState _attendState = const ProviderState();
  ProviderState _leaveState = const ProviderState();
  ProviderState _getLastAttendanceState = const ProviderState();

  AttendanceProvider({
    required AttendanceRepository attendanceRepository,
  })  : _attendanceRepository = attendanceRepository,
        super(repository: attendanceRepository, fromJson: Attendance.fromJson);

  Future<void> findDurationLimits() async {
    return makeApiRequest(
      setState: setDurationLimitsState,
      callback: () async {
        DurationLimits durationLimits =
            await _attendanceRepository.findDurationLimits();

        setDurationLimitsState((state) => state.copyWith(data: durationLimits));
      },
    );
  }

  // TODO:handle duplicating first attendance when find all called after find last in backend
  Future<void> getLast() async {
    if (listState.data.isEmpty &&
        getLastAttendanceState.apiState != ApiState.LOADED) {
      await makeApiRequest(
        setState: setGetLastAttendanceState,
        callback: () async {
          final lastAttendance = await _attendanceRepository.findLast();
          if (lastAttendance != null) {
            shiftToListState(lastAttendance);
          }
        },
      );
    }
  }

  Future<void> canAttend(BuildContext context) async {
    final canAttend = await _attendanceRepository.canAttend();

    if (canAttend) {
      await attend();
    } else {
      showSnackBar(context, "لا يمكنك الحضور بسبب التأخير.");
    }
  }

  Future<void> attend() async {
    await makeApiRequest(
      setState: setAttendState,
      callback: () async {
        final Attendance attendance = await _attendanceRepository.attend();
        shiftToListState(attendance);
      },
    );
  }

  Future<void> canLeave(BuildContext context) async {
    final canLeave = await _attendanceRepository.canLeave();

    if (canLeave) {
      await leave();
    } else {
      showAlertDialog(
        context: context,
        msg: "هل تريد المغادرة قبل الوقت الرسمي؟.",
        onPressedOk: () async {
          await leave();
          Navigator.pop(context);
          Navigator.push(
            context,
            Routes.employeeRequest(requestType: EmployeeRequestType.LEAVING),
          );
        },
      );
    }
  }

  Future<void> leave() async {
    await makeApiRequest(
      setState: setLeaveState,
      callback: () async {
        final leaveResponse = await _attendanceRepository.leave();

        setListState(
          (state) => state.copyWith(
            data: ListUtils.overwriteFirstElementInList(
              state.data,
              leaveResponse,
            ),
          ),
        );
      },
    );
  }

  String? get errorMessage =>
      getLastAttendanceState.errorMessage ??
      listState.errorMessage ??
      attendState.errorMessage ??
      leaveState.errorMessage;

  ProviderState get attendState => _attendState;

  void setAttendState(ProviderStateSetterParameter<ProviderState> setState) {
    ProviderState attendState = setState(this.attendState);
    _attendState = attendState;
    notifyListeners();
  }

  ProviderState get leaveState => _leaveState;

  void setLeaveState(ProviderStateSetterParameter<ProviderState> setState) {
    ProviderState leaveState = setState(this.leaveState);
    _leaveState = leaveState;
    notifyListeners();
  }

  ProviderState get getLastAttendanceState => _getLastAttendanceState;

  void setGetLastAttendanceState(
      ProviderStateSetterParameter<ProviderState> setState) {
    ProviderState getLastAttendanceState =
        setState(this.getLastAttendanceState);
    _getLastAttendanceState = getLastAttendanceState;
    notifyListeners();
  }

  @override
  String toString() =>
      'AttendanceProvider(_attendState: $_attendState,\n_leaveState: $_leaveState,\n_getLastAttendanceState: $_getLastAttendanceState,\nlistState: $listState,\n)';
}
