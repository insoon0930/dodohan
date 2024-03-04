import 'package:dodohan/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/paddings.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 5, indent: ThemePaddings.mainPadding, endIndent: ThemePaddings.mainPadding, color: ThemeColors.chip,);
  }
}
