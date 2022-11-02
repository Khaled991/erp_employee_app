import 'package:erp_employee_app/core/errors/exceptions.dart';

class DateTimeConverter {
  static const Map<int, String> weekDaysInArabic = {
    1: "الإثنين",
    2: "الثلاثاء",
    3: "الأربعاء",
    4: "الخميس",
    5: "الجمعة",
    6: "السبت",
    7: "الإحد",
  };

  static String weekDayToArabicString(int weekDay) {
    if (weekDay >= 1 && weekDay <= 7) {
      return DateTimeConverter.weekDaysInArabic[weekDay]!;
    } else {
      throw DateTimeConverterException();
    }
  }
}
