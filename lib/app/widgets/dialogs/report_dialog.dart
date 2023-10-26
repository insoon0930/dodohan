import 'package:dodohan/app/widgets/dialogs/select/select_dialog.dart';
import 'package:dodohan/app/widgets/dialogs/select/select_dialog_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/fonts.dart';

class ReportDialog extends StatelessWidget {
  final Future<void> Function() reportCallback;
  final Future<void> Function() blockCallback;
  final String? blockText;
  const ReportDialog({Key? key, required this.reportCallback, required this.blockCallback, this.blockText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectDialog(itemHeight: 60, items: [
      SelectDialogItem(
          text: '신고하기',
          onTap: () async {
            await reportCallback();
            Get.back();
            Get.snackbar('신고 완료', '24시간 이내에 확인후 조치하겠습니다');
          },
          first: true,
          style: ThemeFonts.semiBold.getTextStyle(size: 15)),
      SelectDialogItem(
          text: blockText ?? '차단하기(즉시 거절됨)',
          onTap: () async {
            await blockCallback();
            Get.back();
            Get.snackbar('차단 완료', '차단이 완료되었습니다');
          },
          last: true,
          style: ThemeFonts.semiBold.getTextStyle(size: 15)),
    ]);
  }
}
