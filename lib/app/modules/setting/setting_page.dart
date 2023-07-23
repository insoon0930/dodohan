import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/core/controllers/auth_controller.dart';
import 'package:stamp_now/app/widgets/appbars/home_appbarr.dart';
import 'package:stamp_now/core/theme/colors.dart';
import 'package:stamp_now/core/theme/paddings.dart';
import '../../data/model/user.dart';
import 'setting_controller.dart';
import 'widgets/setting_item.dart';
import 'widgets/setting_switch_item.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  User get user => AuthController.to.user.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            settingTextWithPadding('카메라 설정'),
            // SettingSwitchItem(
            //   text: '원본 사진 저장',
            //   rxValue: user.saveOriginal,
            //   onTap: () => controller.switchSaveOriginal(!user.saveOriginal),
            // ),
            // const Divider(height: 1, indent: ThemePaddings.mainPadding),
            // SettingSwitchItem(
            //   text: '즉시 저장',
            //   rxValue: user.saveImmediately,
            //   onTap: () => controller.switchSaveImmediately(!user.saveImmediately),
            // ),
            // const Divider(height: 1, indent: ThemePaddings.mainPadding),
            // //todo 폴더 정하기?
            // SettingSwitchItem(
            //   text: '앱 시작 시 카메라 실행',
            //   rxValue: user.cameraImmediately,
            //   onTap: () => controller.switchCameraImmediately(!user.cameraImmediately),
            // ),
            // settingTextWithPadding('인앱 결제'),
            // SettingSwitchItem(
            //   text: '다크 모드',
            //   rxValue: user.darkMode,
            //   onTap: () => controller.switchDarkMode(!user.darkMode),
            // ),
            const Divider(height: 1, indent: ThemePaddings.mainPadding),
            const SettingItem('스탬프샵'),
            const Divider(height: 1, indent: ThemePaddings.mainPadding),
            const SettingItem('광고 제거'),
            const Divider(height: 1, indent: ThemePaddings.mainPadding),
            const SettingItem('구매 복원'),
            settingTextWithPadding('기타'),
            const SettingItem('문의 하기'),
            const Divider(height: 1, indent: ThemePaddings.mainPadding),
            const SettingItem('리뷰 남기기'),
            settingTextWithPadding(''),
          ],
        ),
      ),
    );
  }

  Widget settingTextWithPadding(String text) {
    return Padding(
      padding: const EdgeInsets.only(
          left: ThemePaddings.mainPadding, bottom: 8, top: 20),
      child: Text(
        text,
        style: const TextStyle(color: ThemeColors.greyText),
      ),
    );
  }
}
