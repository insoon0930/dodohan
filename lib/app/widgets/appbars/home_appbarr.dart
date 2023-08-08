import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../../routes/app_routes.dart';
import '../../modules/home/home_controller.dart';
import '../dialogs/select/select_dialog.dart';
import '../dialogs/select/select_dialog_item.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController? controller;
  const HomeAppBar({this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('두근두근한양', style: ThemeFonts.bold.getTextStyle(size: 22)),
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () => _getDialog(),
          child: Container(
              color: Colors.transparent,
              child: SvgPicture.asset('assets/dots.svg').paddingAll(15)),
        ),
        const SizedBox(width: 1),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  _getDialog() => Get.dialog(SelectDialog(itemHeight: 60, items: [
    SelectDialogItem(
        text: '로그아웃',
        onTap: () => AuthService.to.logOut(),
        first: true,
        style: ThemeFonts.semiBold.getTextStyle(size: 15)),
    if (controller!.user.id == '6BqgdRdFUoZOPclxIzbD')
          SelectDialogItem(
              text: '관리자 페이지',
              onTap: () {
                Get.back();
                Get.toNamed(Routes.admin);
              },
              style: ThemeFonts.semiBold.getTextStyle(size: 15)),
        SelectDialogItem(
        text: '회원탈퇴',
        onTap: () => AuthService.to.withdraw(),
        last: true,
        style: ThemeFonts.medium.getTextStyle(size: 15, color: ThemeColors.redLight)),
  ]));
}
