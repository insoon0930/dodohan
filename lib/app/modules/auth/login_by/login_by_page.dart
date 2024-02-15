import 'dart:developer';
import 'dart:io';

import 'package:animated_background/animated_background.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/auth/login_by/login_by_controller.dart';
import 'package:dodohan/core/theme/fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/paddings.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/info_data.dart';
import '../../../widgets/dialogs/action_dialog.dart';
import '../../../widgets/dialogs/store_routing_dialog.dart';

class LoginByPage extends StatefulWidget {
  const LoginByPage({Key? key}) : super(key: key);

  @override
  State<LoginByPage> createState() => _LoginByPageState();
}

class _LoginByPageState extends State<LoginByPage> {
  final LoginByController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            'assets/start_background.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(flex: 1),
              SvgPicture.asset('assets/dodocam.svg', width: Get.width * 0.45),
              const Spacer(flex: 2),
              ElevatedButton(
                style: BtStyle.loginBy,
                onPressed: () {
                  if (kIsWeb) {
                    Get.dialog(const StoreRoutingDialog());
                    return;
                  }
                  Get.toNamed(Routes.login);
                },
                child: Text('전화번호로 시작하기', style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
              ).paddingAll(ThemePaddings.mainPadding),
            ],
          ),
        ],
      ),
    );
  }
}
