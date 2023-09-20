import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  const CardContainer({Key? key, required this.child, this.width, this.height, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: ThemeColors.grayLightest),
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [BoxShadow(color: Color(0x1E7090B0), blurRadius: 58, offset: Offset(0, 40), spreadRadius: -20)],
      ),
      child: child,
    );
  }
}