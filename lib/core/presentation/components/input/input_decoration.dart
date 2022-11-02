import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
InputDecoration outlineInputDecoration(
  BuildContext context, {
  String? label,
}) {
  return InputDecoration(
    label: label != null ? Text(label) : null,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 22,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(Paddings.small),
      ),
    ),
    contentPadding: const EdgeInsets.all(Paddings.small),
  );
}
