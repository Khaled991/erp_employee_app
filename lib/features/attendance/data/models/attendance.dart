import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  const Attendance._();

  factory Attendance({
    required int id,
    required DateTime attendTime,
    required DateTime? leaveTime,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  bool get hasLeft => leaveTime != null;
}
