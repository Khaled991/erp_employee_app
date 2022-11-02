import 'package:erp_employee_app/core/data/entities/duration_limits/duration_limits.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "should convert Map<String,dynamic into a DurationLimits object when DurationLimits.fromJson called",
    () async {
      // arrange
      const Map<String, dynamic> durationLimitsJsonResponse = {
        "start": "2021-06-29T08:26:32.000Z",
        "end": "2022-07-21T23:53:58.000Z"
      };
      // act
      DurationLimits durationLimits =
          DurationLimits.fromJson(durationLimitsJsonResponse);
      // assert
      expect(durationLimits.start.toIso8601String(),
          durationLimitsJsonResponse["start"]);
      expect(durationLimits.end.toIso8601String(),
          durationLimitsJsonResponse["end"]);
    },
  );
}
