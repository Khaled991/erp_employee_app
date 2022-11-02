import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_limits.freezed.dart';
part 'duration_limits.g.dart';

//   {
//     "start": "2021-06-29T08:26:32.000Z",
//     "end": "2022-07-21T23:53:58.000Z"
// }

@freezed
class DurationLimits with _$DurationLimits {
  factory DurationLimits({
    required DateTime start,
    required DateTime end,
  }) = _DurationLimits;

  factory DurationLimits.fromJson(Map<String, dynamic> json) =>
      _$DurationLimitsFromJson(json);
}
