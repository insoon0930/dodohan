import 'package:animated_background/animated_background.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/auth/login_by/login_by_controller.dart';
import 'package:stamp_now/core/theme/fonts.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/paddings.dart';
import '../../../../routes/app_routes.dart';

class LoginByPage extends StatefulWidget {
  const LoginByPage({Key? key}) : super(key: key);

  @override
  State<LoginByPage> createState() => _LoginByPageState();
}

class _LoginByPageState extends State<LoginByPage> with TickerProviderStateMixin {
  final LoginByController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            baseColor: ThemeColors.mainLight,
            spawnOpacity: 0.0,
            opacityChangeRate: 0.25,
            minOpacity: 0.1,
            maxOpacity: 0.2,
            spawnMinSpeed: 20.0,
            spawnMaxSpeed: 40.0,
            spawnMinRadius: 25.0,
            spawnMaxRadius: 45.0,
            particleCount: 30,
          )
        ),
        vsync: this,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Text('두근두근캠퍼스', style: ThemeFonts.bold.getTextStyle(size: 24, color: ThemeColors.main)),
              const SizedBox(height: 8),
              Text('한양 · 중앙 · 연세 · 건국 · 외대', style: ThemeFonts.medium.getTextStyle(size: 12, color: ThemeColors.main)),
              const Spacer(),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _animatedNum(controller.manNum.value + controller.womanNum.value, text: '이용자 수', color: Colors.black).paddingOnly(right: 32),
                  _animatedNum(controller.manNum.value, text: '남성', color: ThemeColors.blueLight),
                  _animatedNum(controller.womanNum.value, text: '여성', color: ThemeColors.redLight).paddingSymmetric(horizontal: 32),
                  _animatedNum(controller.genderRatio.value, text: '성비', color: ThemeColors.main, fractionDigits: 2),
                ],
              )),
              ElevatedButton(
                style: BtStyle.loginBy,
                onPressed: () => Get.toNamed(Routes.login),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/start_phone.svg'),
                    Text('전화번호로 시작하기',
                        style:
                        ThemeFonts.medium.getTextStyle()),
                    SizedBox(width: SvgPicture.asset('assets/start_phone.svg').width),
                  ],
                ),
              ).paddingAll(ThemePaddings.mainPadding),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedNum(var number, {required Color color, required String text, int fractionDigits = 0}) => Column(
    children: [
      AnimatedDigitWidget(
        textStyle: ThemeFonts.medium.getTextStyle(color: color ,size: 20),
        value: number,
        fractionDigits: fractionDigits,
        duration: const Duration(milliseconds: 500),
      ),
      Text(text, style: ThemeFonts.medium.getTextStyle(size: 13))
        ],
  );
}

