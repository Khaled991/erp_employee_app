import 'package:erp_employee_app/core/config/theme/colors.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoResultsFound extends StatelessWidget {
  final double imageSize;
  final double fontSize;
  final String notFoundText;

  const NoResultsFound({
    Key? key,
    this.imageSize = 300,
    this.fontSize = 28.0,
    this.notFoundText = 'لا توجد نتائج',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Paddings.screen),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/SVG/no_results_found.svg",
            semanticsLabel: 'لا توجد نتائج',
            width: imageSize,
          ),
          const SizedBox(height: 10.0),
          Text(
            notFoundText,
            style: TextStyle(
              color: darkColor,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
