import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../../routes/app_routes.dart';
import '../../data/info_data.dart';
import '../../modules/lobby/lobby_controller.dart';
import '../dialogs/select/select_dialog.dart';
import '../dialogs/select/select_dialog_item.dart';
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
        AuthService.to.isForFree
            ? const SettingIconButton()
            : Row(
                children: [
                  SvgPicture.asset('assets/love.svg'),
                  const SizedBox(width: 6),
                  Text('3', style: ThemeFonts.semiBold.getTextStyle(size: 20))
                ],
              ).paddingOnly(right: 16),
        const SizedBox(width: 1),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
