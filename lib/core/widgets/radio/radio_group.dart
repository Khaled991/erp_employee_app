// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:erp_employee_app/core/widgets/radio/radio_props.dart';
import 'package:flutter/material.dart';

import 'custom_radio.dart';

class RadioGroup<T> extends StatelessWidget {
  final List<RadioProps> radiosProps;
  final String? groupTitle;
  final T activeValue;
  final bool showDivider;
  final void Function(T? value) onChanged;

  const RadioGroup({
    Key? key,
    required this.radiosProps,
    this.groupTitle,
    required this.activeValue,
    required this.onChanged,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (groupTitle != null)
          Text(
            groupTitle!,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ...radiosProps.map<Widget>(
          (RadioProps radioProps) {
            return CustomRadio<T>(
              activeValue: activeValue,
              title: radioProps.title,
              onChanged: onChanged,
              value: radioProps.value,
            );
          },
        ).toList(),
        if (showDivider) const Divider(),
      ],
    );
  }
}
