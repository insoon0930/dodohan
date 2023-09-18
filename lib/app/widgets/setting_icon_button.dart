import 'package:flutter/material.dart';
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
      icon: const Icon(Icons.settings_outlined),
      color: ThemeColors.grayDark,
      selectedIcon: const Icon(Icons.settings),
      onPressed: () => Get.toNamed(Routes.setting),
    );
  }
}
