import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/core/theme/fonts.dart';
import '../../../../core/theme/paddings.dart';
import 'login_controller.dart';
import 'widgets/phone_sms_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Get.focusScope?.unfocus(),
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 54.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('휴대폰 본인 인증', style: ThemeFonts.bold.getTextStyle(size: 24)))
                    .paddingOnly(left: ThemePaddings.mainPadding),
                const SizedBox(height: 14.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('회원여부 확인 및 가입을 진행합니다.', style: ThemeFonts.medium.getTextStyle(size: 24)))
                    .paddingOnly(left: ThemePaddings.mainPadding),
                const SizedBox(height: 30.0),
                Expanded(child: PhoneSMSWidget()),
                const SizedBox(height: ThemePaddings.mainPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
