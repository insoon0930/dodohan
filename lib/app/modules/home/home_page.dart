import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../../core/theme/paddings.dart';
import '../../../routes/app_routes.dart';
import '../../data/model/me_info.dart';
import '../../data/model/you_info.dart';
import '../../widgets/appbars/home_appbarr.dart';
import '../../widgets/dialogs/application_dialog.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          _upperBox(),
          const Divider(thickness: 10, color: ThemeColors.grayLightest).paddingSymmetric(vertical: 16),
          _lowerBox(),
        ],
      ),
    );
  }

  Widget _upperBox() => Column(
    children: [
      const SizedBox(height: 52),
      Center(
        child: Column(
          children: [
            Text(
              "13",
              style: ThemeFonts.bold.getTextStyle(size: 56, color: ThemeColors.main),
            ),
            Text(
              "신청자 수",
              style: ThemeFonts.medium.getTextStyle(size: 11),
            ),
            //todo 타이머
            const SizedBox(height: 16),
            Text(
              "3일 3시간 15분",
              style: ThemeFonts.bold.getTextStyle(size: 30, color: ThemeColors.mainLight),
            ),
            const SizedBox(height: 4),
            Text(
              "마감까지 남은 시간",
              style: ThemeFonts.medium.getTextStyle(size: 11),
            ),
          ],
        ),
      ),
      const SizedBox(height: 52),
      ElevatedButton(
        style: BtStyle.standard,
        onPressed: () {},
        child: Text('결과 확인',
            style:
            ThemeFonts.medium.getTextStyle(color: Colors.white)),
      ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
      const SizedBox(height: 16),
      Text(
        "* '금요일' 하루동안 확인할 수 있습니다",
        style: ThemeFonts.medium.getTextStyle(size: 11),
      ),
    ],
  );

  Widget _lowerBox() => Column(
    children: [
      Row(
        children: [
          const SizedBox(width: 16),
          ElevatedButton(
            style: BtStyle.info,
            onPressed: () => Get.toNamed(Routes.meInfo),
            child: Text('나',
                style:
                ThemeFonts.medium.getTextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            style: BtStyle.info,
            onPressed: () => Get.toNamed(Routes.youInfo),
            child: Text('이상형',
                style:
                ThemeFonts.medium.getTextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      const SizedBox(height: 16),
      Text(
        "* '나'와 '이상형'을 모두 작성후 신청해주세요",
        style: ThemeFonts.medium.getTextStyle(size: 11),
      ),
      const Divider(thickness: 10, color: ThemeColors.grayLightest).paddingSymmetric(vertical: 16),
      ElevatedButton(
        style: BtStyle.standard,
        onPressed: () async {
          Map<String, dynamic> res = await controller.getInfos();
          MeInfo meInfo = res['meInfo'];
          YouInfo youInfo = res['youInfo'];
          Get.dialog(ApplicationDialog(
              meInfo: meInfo,
              youInfo: youInfo,
              applyClicked: () => controller.apply(meInfo, youInfo)));
        },
        child: Text('신청하기',
            style:
            ThemeFonts.medium.getTextStyle(color: Colors.white)),
      ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
    ],
  );

}
