import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';
import '../../core/utils/utility.dart';

class SelectablePhoneNum extends StatelessWidget {
  final String phoneNum;

  const SelectablePhoneNum({Key? key, required this.phoneNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: phoneNum));
          Get.snackbar('전화번호', '클립보드에 저장 완료');
        },
        child: Text(Utility.formatPhoneNum(phoneNum),
                style: ThemeFonts.semiBold.getTextStyle(
                    size: 25,
                    color: ThemeColors.main,
                    decoration: TextDecoration.underline)));
  }
}
