import 'package:erp_employee_app/core/constants/global_colors.dart';
import 'package:flutter/material.dart';

import 'package:erp_employee_app/core/presentation/components/input/input_decoration.dart';

class Dropdown<T> extends StatelessWidget {
  final T? value;
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final String? Function(T?)? validator;

  final String? label;

  const Dropdown({
    Key? key,
    required this.value,
    this.onChanged,
    this.items,
    this.validator,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        toggleableActiveColor: Colors.transparent,
        focusColor: Colors.transparent,
      ),
      child: DropdownButtonFormField<T>(
        validator: validator,
        isExpanded: true,
        itemHeight: 60.0,
        value: value,
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: GlobalColors.primary,
          size: 30.0,
        ),
        iconSize: 24,
        elevation: 16,
        decoration: outlineInputDecoration(context, label: label),
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
