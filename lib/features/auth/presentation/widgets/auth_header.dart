import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/global_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    Key? key,
    required this.topHeight,
  }) : super(key: key);

  final double topHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: GlobalColors.lightGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45.0),
          bottomRight: Radius.circular(45.0),
        ),
      ),
      height: topHeight,
      child: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Center(
          child: SvgPicture.asset(
            "assets/SVG/sign-in.svg",
          ),
        ),
      ),
    );
  }
}
