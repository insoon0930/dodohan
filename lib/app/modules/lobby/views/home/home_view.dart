import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../core/theme/buttons.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/paddings.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../widgets/setting_icon_button.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _upperBox(),
          const Divider(thickness: 10, color: ThemeColors.grayLightest)
              .paddingSymmetric(vertical: 16),
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
                    if (AuthService.to.isAdmin)
                      Column(
                        children: [
                          _applicantNum(),
                          Text(
                            "신청자 수",
                            style: ThemeFonts.medium.getTextStyle(size: 11),
                          ),
                        ],
                      ),
                    if (!AuthService.to.isAdmin)
                      _userNumData(),
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
              const SizedBox(height: 40),
              ElevatedButton(
                style: BtStyle.standard(),
                onPressed: () => controller.getMatchResult(),
                child: const Text('매칭 결과 확인'),
              ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
              const SizedBox(height: 16),
              Text(
                "* '금요일' 하루간 확인할 수 있습니다",
                style: ThemeFonts.medium.getTextStyle(size: 11),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () => controller.tapProfileImage(),
                  child: CircleAvatar(backgroundImage: NetworkImage(controller.user.profileImage))),
              const SettingIconButton(),
            ],
          ).paddingSymmetric(horizontal: 16),
        ],
      );

  Widget _lowerBox() => Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Flexible(
                child: ElevatedButton(
                  style: BtStyle.standard(color: ThemeColors.mainLight),
                  onPressed: () => Get.toNamed(Routes.meInfo),
                  child: const Text('나'),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: ElevatedButton(
                  style: BtStyle.standard(color: ThemeColors.mainLight),
                  onPressed: () => Get.toNamed(Routes.youInfo),
                  child: const Text('이상형'),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: BtStyle.standard(),
            onPressed: () => controller.getInfos(),
            child: const Text('이번 회차 신청'),
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
              style: ThemeFonts.bold
                  .getTextStyle(size: 56, color: ThemeColors.main),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      );

  Widget _userNumData() => Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "${controller.userNum.value}",
                  style: ThemeFonts.bold
                      .getTextStyle(size: 40, color: ThemeColors.main),
                ),
                Text(
                  "가입자 수",
                  style: ThemeFonts.medium.getTextStyle(size: 11),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  (controller.genderRatio.value).toStringAsFixed(2),
                  style: ThemeFonts.bold
                      .getTextStyle(size: 40, color: ThemeColors.main),
                ),
                Text(
                  "성비",
                  style: ThemeFonts.medium.getTextStyle(size: 11),
                ),
              ],
            ),
          ],
        ),
      );
}
