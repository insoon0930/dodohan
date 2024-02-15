import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/theme/colors.dart';
import '../../routes/app_routes.dart';

class SettingIconButton extends StatelessWidget {
  const SettingIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      isSelected: true,
      constraints: const BoxConstraints(), // 패딩 설정
      padding: EdgeInsets.zero, // 패딩 설정
      icon: SvgPicture.asset('assets/setting.svg'),
      color: ThemeColors.grayDark,
      onPressed: () => Get.toNamed(Routes.setting),
    );
  }
}
