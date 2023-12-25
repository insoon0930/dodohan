import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';

class ActionDialog extends StatelessWidget {
  final String title;
  final String text;
  final String? subText;
  final Function confirmCallback;
  final String buttonText;

  const ActionDialog(
      {Key? key,
      required this.title,
      required this.text,
      this.subText,
      required this.confirmCallback,
      this.buttonText = '확인'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding:
            const EdgeInsets.only(top: 39, bottom: 30, left: 30, right: 30),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(33)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: ThemeFonts.bold.getTextStyle(size: 20)),
            const SizedBox(height: 14),
            Text(text,
                style: ThemeFonts.medium.getTextStyle(size: 17),
                textAlign: TextAlign.center),
            if (subText != null)
              Text(subText!,
                      style: ThemeFonts.regular
                          .getTextStyle(size: 14, color: ThemeColors.grayText),
                      textAlign: TextAlign.center)
                  .paddingOnly(top: 14),
            const SizedBox(height: 29),
            ElevatedButton(
                onPressed: () => confirmCallback(),
                style: BtStyle.confirm,
                child: Text(buttonText,
                    style: ThemeFonts.medium
                        .getTextStyle(size: 16, color: ThemeColors.mainLight),
                    textAlign: TextAlign.center))
          ],
        ),
      ),
    );
  }
}
