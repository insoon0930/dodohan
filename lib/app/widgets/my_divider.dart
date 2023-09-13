import 'package:flutter/material.dart';

import '../../core/theme/paddings.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, indent: ThemePaddings.mainPadding, endIndent: ThemePaddings.mainPadding);
  }
}
