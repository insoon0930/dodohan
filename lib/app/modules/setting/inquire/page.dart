import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/fonts.dart';
import '../../../widgets/appbars/default_appbar.dart';

class InquirePage extends StatelessWidget {
  const InquirePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('문의하기'),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () =>
                  launchUrl(
                    Uri(
                      scheme: 'https',
                      host: 'open.kakao.com',
                      path: 'o/sX5oMOBf',
                    ),
                    mode: LaunchMode.externalApplication,
                  ),
              child: const Text(
                'https://open.kakao.com/o/sX5oMOBf',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ).paddingOnly(top: 30, bottom: 10),
            Text('오픈카카오톡으로 문의하기', style: ThemeFonts.medium.getTextStyle())
          ],
        ),
      ),
    );
  }
}
