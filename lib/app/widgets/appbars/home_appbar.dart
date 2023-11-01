import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/theme/fonts.dart';
import '../../../routes/app_routes.dart';
import '../../data/info_data.dart';
import '../../modules/lobby/lobby_controller.dart';
import '../setting_icon_button.dart';

class LobbyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final LobbyController controller = Get.find();

  LobbyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
          '두근두근${InfoData.univInfo[controller.user.univ]?.appTitleTail ?? '캠퍼스'}',
          style: ThemeFonts.bold.getTextStyle(size: 22)),
      elevation: 0,
      actions: [
        GestureDetector(
            onTap: () => Get.toNamed(Routes.store),
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  SvgPicture.asset('assets/love.svg'),
                  const SizedBox(width: 6),
                  Obx(() => Text('${controller.user.coin}', style: ThemeFonts.semiBold.getTextStyle(size: 20)))
                ],
              ).paddingOnly(right: 16),
            ),
          ),
        const SizedBox(width: 1),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
