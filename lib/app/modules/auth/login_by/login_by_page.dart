import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
              Text('두근두근한양', style: ThemeFonts.bold.getTextStyle(size: 24, color: ThemeColors.main)),
              const Spacer(),
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
}

