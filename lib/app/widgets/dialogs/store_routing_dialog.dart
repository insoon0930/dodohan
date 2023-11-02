import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';

class StoreRoutingDialog extends StatelessWidget {
  const StoreRoutingDialog({Key? key}) : super(key: key);

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
            Text('앱 출시 완료',
                style: ThemeFonts.bold.getTextStyle(size: 20)),
            const SizedBox(height: 14),
            Text("'데일리 매치' 기능 추가와 함께 앱으로 출시되었어요!",
                style: ThemeFonts.medium.getTextStyle(size: 17),
                textAlign: TextAlign.center),
            const SizedBox(height: 29),
            ElevatedButton(
                onPressed: () async {
                  Get.back();
                  Uri url = Uri.parse('https://play.google.com/store/apps/details?id=com.dodohan');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                style: BtStyle.confirm,
                child: Text('Google Play Store',
                    style: ThemeFonts.medium
                        .getTextStyle(size: 16, color: ThemeColors.mainLight),
                    textAlign: TextAlign.center)),
            const SizedBox(height: 14),
            ElevatedButton(
                onPressed: () async {
                  Get.back();
                  Uri url = Uri.parse('https://apps.apple.com/kr/app/%EB%91%90%EA%B7%BC%EB%91%90%EA%B7%BC%EC%BA%A0%ED%8D%BC%EC%8A%A4/id6468897896');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                style: BtStyle.confirm,
                child: Text('App Store',
                    style: ThemeFonts.medium
                        .getTextStyle(size: 16, color: ThemeColors.mainLight),
                    textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
