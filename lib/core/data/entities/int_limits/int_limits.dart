import 'package:freezed_annotation/freezed_annotation.dart';

part 'int_limits.freezed.dart';

@freezed
class IntLimits with _$IntLimits {
  factory IntLimits({
    required int start,
    required int end,
  }) = _IntLimits;
}
