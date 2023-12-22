import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:dodohan/core/theme/paddings.dart';
import '../../../core/services/auth_service.dart';
import '../../../routes/app_routes.dart';
import '../../data/model/user.dart';
import '../../widgets/appbars/default_appbar.dart';
import '../../widgets/dialogs/action_dialog.dart';
import '../../widgets/dividers/my_divider.dart';
import 'widgets/setting_item.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('설정'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          settingTextWithPadding('고객센터'),
          SettingItem('문의하기', onTap: () => Get.toNamed(Routes.inquire)),
          const MyDivider(),
          // SettingItem('공지사항', onTap: () => Get.toNamed(Routes.updates)),
          // const MyDivider(),
          SettingItem('자주하는 질문', onTap: () => Get.toNamed(Routes.questions)),
          const MyDivider(),
          SettingItem('사업자 정보', onTap: () => Get.toNamed(Routes.businessInfo)),
          const MyDivider(),
          SettingItem('이용약관', onTap: () => Get.toNamed(Routes.termsOfUse)),
          const MyDivider(),
          SettingItem('개인정보처리방침', onTap: () => Get.toNamed(Routes.privacy)),
          const Divider(thickness: 10, color: ThemeColors.grayLightest,),
          settingTextWithPadding('계정'),
          if (!AuthService.to.isAdmin)
            SettingItem('회원탈퇴',
                onTap: () => Get.dialog(ActionDialog(
                    title: '회원 탈퇴',
                    text: '30일간 재가입이 제한됩니다',
                    // text: '이후 재가입에 제한이\n있을 수 있습니다',
                    buttonText: '탈퇴하기',
                    confirmCallback: () => AuthService.to.withdraw()))),
          if (AuthService.to.isAdmin)
            SettingItem('관리자 페이지', onTap: () => Get.toNamed(Routes.admin)),
          const MyDivider(),
          SettingItem('로그아웃', onTap: () => AuthService.to.logOut()),
          Expanded(child: Container(width: Get.width, color: ThemeColors.grayLightest))
        ],
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
