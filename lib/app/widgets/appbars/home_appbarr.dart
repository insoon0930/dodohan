import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../dialogs/select/select_dialog.dart';
import '../dialogs/select/select_dialog_item.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('두근두근캠퍼스', style: ThemeFonts.bold.getTextStyle(size: 22)),
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
        onTap: () async {
          Get.back();
        },
        first: true,
        style: ThemeFonts.semiBold.getTextStyle(size: 15)),
    if(true) //todo 관리자이면
    SelectDialogItem(
        text: '관리자 페이지',
        onTap: () async {
          Get.back();
        },
        style: ThemeFonts.semiBold.getTextStyle(size: 15)),
    SelectDialogItem(
        text: '회원탈퇴',
        onTap: () {
          Get.back();
        },
        last: true,
        style: ThemeFonts.medium.getTextStyle(size: 15, color: ThemeColors.redLight)),
  ]));
}
