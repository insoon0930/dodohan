import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';

class SelectDialogItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool first;
  final bool last;
  final TextStyle? style;
  final bool isCenter;

  const SelectDialogItem(
      {Key? key,
        required this.text,
        required this.onTap,
        this.first = false,
        this.last = false,
        this.style,
        this.isCenter = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: first
              ? const BorderRadius.only(topLeft: Radius.circular(17), topRight: Radius.circular(17))
              : last
              ? const BorderRadius.only(bottomLeft: Radius.circular(17), bottomRight: Radius.circular(17))
              : null,
        ),
        child: SizedBox(
          height: last ? 59 : 60,
          child: Column(
            children: [
              Expanded(
                child: Align(
                    alignment: isCenter ? Alignment.center : Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: isCenter ? 0 : 30),
                      child:
                      Text(text, style: style ?? ThemeFonts.medium.getTextStyle(size: 15, color: Colors.black)),
                    )),
              ),
              if (!last) const Divider(color: ThemeColors.grayLightest)
            ],
          ),
        ),
      ),
    );
  }
}