import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../../core/theme/paddings.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/appbars/home_appbarr.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(controller: controller),
      body: Column(
        children: [
          _upperBox(),
          const Divider(thickness: 10, color: ThemeColors.grayLightest).paddingSymmetric(vertical: 16),
          _lowerBox(),
        ],
      ),
    );
  }

  Widget _upperBox() => Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 52),
              Center(
                child: Column(
                  children: [
                    _applicantNum(),
                    Text(
                      "신청자 수",
                      style: ThemeFonts.medium.getTextStyle(size: 11),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => Text(
                        controller.leftDay.value,
                        style: ThemeFonts.bold.getTextStyle(
                            size: 30, color: ThemeColors.mainLight),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "이번 회차 마감까지",
                      style: ThemeFonts.medium.getTextStyle(size: 11),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 52),
              ElevatedButton(
                style: BtStyle.standard,
                onPressed: () => controller.getMatchResult(),
                child: Text('결과 확인',
                    style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
              ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
              const SizedBox(height: 16),
              Text(
                "* '금요일' 하루동안 확인할 수 있습니다",
                style: ThemeFonts.medium.getTextStyle(size: 11),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => controller.updateProfileImage(),
            child: CircleAvatar(
                backgroundImage: NetworkImage(controller.user.profileImage))
                .paddingOnly(left: 16),
          ),
        ],
      );

  Widget _lowerBox() => Column(
    children: [
      Row(
        children: [
          const SizedBox(width: 16),
          Flexible(
            child: ElevatedButton(
              style: BtStyle.info,
              onPressed: () => Get.toNamed(Routes.meInfo),
              child: Text('나',
                  style:
                  ThemeFonts.medium.getTextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: ElevatedButton(
              style: BtStyle.info,
              onPressed: () => Get.toNamed(Routes.youInfo),
              child: Text('이상형',
                  style:
                  ThemeFonts.medium.getTextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        style: BtStyle.standard,
        onPressed: () => controller.getInfos(),
        child: Text('신청하기',
            style:
            ThemeFonts.medium.getTextStyle(color: Colors.white)),
      ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
      const SizedBox(height: 16),
      Text(
        "* '나'와 '이상형'을 모두 작성후 신청해주세요",
        style: ThemeFonts.medium.getTextStyle(size: 11),
      ),
    ],
  );

  Widget _applicantNum() => StreamBuilder<int>(
    stream: controller.getApplicantsNumStream(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(
          "${snapshot.data}",
          style: ThemeFonts.bold.getTextStyle(size: 56, color: ThemeColors.main),
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return const CircularProgressIndicator();
      }
    },
  );

}
