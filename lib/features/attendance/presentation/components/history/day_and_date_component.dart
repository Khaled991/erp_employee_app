import 'package:erp_employee_app/core/errors/error_messages.dart';
import 'package:erp_employee_app/core/errors/exceptions.dart';
import 'package:erp_employee_app/core/utils/date_time_converter.dart';
import 'package:erp_employee_app/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';

class DayAndDate extends StatelessWidget {
  final int dayNumber;
  final int weekDay;

  const DayAndDate({
    Key? key,
    required this.dayNumber,
    required this.weekDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final String weekDayText;
    try {
      weekDayText = DateTimeConverter.weekDayToArabicString(weekDay);
    } on DateTimeConverterException {
      showSnackBar(context, ErrorMessages.SOMETHING_WENT_WRONG_TRY_AGAIN);
      weekDayText = "";
    }

    return Container(
      height: 100.0,
      width: 70.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayNumber.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          Text(
            weekDayText,
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
