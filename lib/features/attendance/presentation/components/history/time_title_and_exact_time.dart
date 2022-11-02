import 'package:erp_employee_app/core/utils/date_time_util.dart';
import 'package:flutter/material.dart';

enum TimeTitle {
  attendance,
  leaving,
}

class TimeTitleAndExactTime extends StatelessWidget {
  final TimeTitle timeTitle;
  final DateTime? dateTime;

  const TimeTitleAndExactTime({
    Key? key,
    required this.timeTitle,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _getTimeTitleString(),
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          dateTime != null ? DateTimeUtils.toHHMM(dateTime!) : "لم تنصرف بعد",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _getTimeTitleString() {
    switch (timeTitle) {
      case TimeTitle.attendance:
        return "وقت الحضور";
      case TimeTitle.leaving:
        return "وقت الانصراف";
      default:
        return "الوقت";
    }
  }
}
