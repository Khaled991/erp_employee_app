import 'package:freezed_annotation/freezed_annotation.dart';

part 'hr_message.freezed.dart';
part 'hr_message.g.dart';

@freezed
class HrMessage with _$HrMessage {
  factory HrMessage({
    required int id,
    required String message,
    required DateTime messageDateTime,
    required bool seen,
  }) = _HrMessage;

  factory HrMessage.fromJson(dynamic json) => _$HrMessageFromJson(json);
}
