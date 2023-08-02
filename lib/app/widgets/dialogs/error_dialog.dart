import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';

class ErrorDialog extends StatelessWidget {
  final String text;

  const ErrorDialog({Key? key, required this.text}) : super(key: key);

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
            Text(text,
                style: ThemeFonts.medium.getTextStyle(size: 17),
                textAlign: TextAlign.center),
            const SizedBox(height: 29),
            ElevatedButton(
                onPressed: () => Get.back(),
                style: BtStyle.confirm,
                child: Text('확인',
                    style: ThemeFonts.medium
                        .getTextStyle(size: 16, color: ThemeColors.mainLight),
                    textAlign: TextAlign.center))
          ],
        ),
      ),
    );
  }
}
