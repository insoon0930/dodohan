import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';

class ExpandableBox extends StatelessWidget {
  final String title;
  final String body;
  final String? createdAt;

  const ExpandableBox({Key? key, required this.title, required this.body, this.createdAt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: ThemeFonts.medium.getTextStyle()),
          if(createdAt!=null)
            Text(createdAt!, style: ThemeFonts.regular.getTextStyle(size: 12, color: ThemeColors.grayDark)).paddingOnly(top: 4),
        ],
      ),
      collapsed: Container(),
      expanded: Text(body, style: ThemeFonts.regular.getTextStyle(size: 14)),
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        useInkWell: false,
      ),
    );
  }
}
