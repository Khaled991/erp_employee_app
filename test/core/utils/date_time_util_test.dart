import 'package:erp_employee_app/core/utils/date_time_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("toHHMM", () {
    test(
        'should return 10:05 م when passed DateTime with 22 hours and 5 minutes',
        () async {
      // arrange
      final dateTime = DateTime(2022, 7, 1, 22, 05);
      // act
      final String dateTimeHHMM = DateTimeUtils.toHHMM(dateTime);
      // assert
      expect(dateTimeHHMM, '10:05 م');
    });
  });

  group("toYYYYMM", () {
    test('should return 2022-07 when passed DateTime(2022, 7)', () async {
      // arrange
      final dateTime = DateTime(2022, 7);
      // act
      final String dateTimeYYYYMM = DateTimeUtils.toYYYYMM(dateTime);
      // assert
      expect(dateTimeYYYYMM, '2022-07');
    });
  });
}
