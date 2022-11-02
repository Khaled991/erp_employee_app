import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final DateTime attendTime;

  const TimerWidget({
    Key? key,
    required this.attendTime,
  }) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Duration _time;

  @override
  void initState() {
    super.initState();

    time = widget.attendTime.difference(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      time = time + const Duration(seconds: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final time =
        DateTime.now().difference(widget.attendTime).toString().split(".")[0];

    return Text(
      time,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50.0,
        height: 1.5,
      ),
    );
  }

  Duration get time => _time;

  set time(Duration time) {
    if (mounted) {
      setState(() => _time = time);
    }
  }
}
