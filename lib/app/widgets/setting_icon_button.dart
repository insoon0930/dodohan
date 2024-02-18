import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/theme/colors.dart';
import '../../routes/app_routes.dart';

class SettingIconButton extends StatelessWidget {
  const SettingIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset('assets/setting.svg'),
      onTap: () => Get.toNamed(Routes.setting),
    );
  }
}
