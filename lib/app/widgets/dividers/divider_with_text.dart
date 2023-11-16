import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/fonts.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Text(text, style: ThemeFonts.semiBold.getTextStyle()).paddingSymmetric(horizontal: 8),
        const Expanded(child: Divider()),
      ],
    );
  }
}
