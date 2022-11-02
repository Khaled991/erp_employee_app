import 'package:intl/intl.dart';

class DateTimeUtils {
  static String toHHMM(DateTime dateTime) {
    return DateFormat.jm()
        .format(dateTime)
        .replaceFirst("AM", "ص")
        .replaceFirst("PM", "م");
  }

  static String toYYYYMM(DateTime dateTime) {
    return DateFormat("yyyy-MM")
        .format(dateTime)
        .replaceFirst("AM", "ص")
        .replaceFirst("PM", "م");
  }
}
