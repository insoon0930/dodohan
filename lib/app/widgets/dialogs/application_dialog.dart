import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../data/model/me_info.dart';
import '../../data/model/you_info.dart';

class ApplicationDialog extends StatelessWidget {
  final MeInfo meInfo;
  final YouInfo youInfo;
  final Function applyClicked;

  const ApplicationDialog({Key? key, required this.meInfo, required this.youInfo, required this.applyClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            boxShadow: [BoxShadow(color: Color(0x1a000000), offset: Offset(2, 2), blurRadius: 8, spreadRadius: 0)],
            color: Color(0xfffefffe)),
        child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 32),
          Text('이대로 신청할까요?', style: ThemeFonts.bold.getTextStyle(size: 20)),
          const SizedBox(height: 12),
          Text('1차 매칭이 성사되면\n내 프로필 사진이 상대방에게 전달돼요', style: ThemeFonts.medium.getTextStyle(size: 14, color: ThemeColors.grayText), textAlign: TextAlign.center,),
          const SizedBox(height: 16),
          _youInfo(),
          // const SizedBox(height: 16),
          ElevatedButton(
            style: BtStyle.standard(),
            onPressed: () => applyClicked(),
            child: const Center(child: Text('신청')),
          ).paddingAll(24)
        ]),
      ),
    );
  }

  Widget _item(String type, String value) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(child: Text('$type : ', style: ThemeFonts.medium.getTextStyle(size: 14))),
      Flexible(child: Text(value, style: ThemeFonts.medium.getTextStyle(size: 14))),
    ],
  ).paddingSymmetric(vertical: 6, horizontal: 16);

  Widget _meInfo() => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Expanded(
                  child: Text('< 나 >',
                          textAlign: TextAlign.center,
                          style: ThemeFonts.semiBold.getTextStyle(size: 14))
                      .paddingSymmetric(vertical: 6)),
              Expanded(child: _item('학과', meInfo.major!)),
        ],
      ),
      Row(
        children: [
          Expanded(child: _item('키', '${meInfo.height}')),
          Expanded(child: _item('나이', '${meInfo.age}')),
        ],
      ),
      Row(
        children: [
          Expanded(child: _item('체형', meInfo.bodyShape!)),
          Expanded(child: _item('흡연', meInfo.isSmoker! ? '흡연' : '비흡연')),
        ],
      ),
    ],
  );

  Widget _youInfo() => Container(
    decoration: ShapeDecoration(
      color: ThemeColors.cream,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: ThemeColors.chip),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    padding: const EdgeInsets.only(top: 12, bottom: 16, left: 20, right: 20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: ThemeColors.grayLightest),
              borderRadius: BorderRadius.circular(39),
            ),
          ),
          child: Text('나의 이상형', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.blackTextLight),
          ),
        ),
        const SizedBox(height: 17),
        Row(
          children: [
            Expanded(flex: 1, child: Text('동일학과', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayTextLight))),
            Expanded(flex: 2, child: Text(youInfo.exceptSameMajor! ? '제외' : '상관 없음', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.main))),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Expanded(flex: 1, child: Text('키', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayTextLight))),
            Expanded(flex: 2, child: Text('${youInfo.minHeight} ~ ${youInfo.maxHeight}cm', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.main))),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Expanded(flex: 1, child: Text('나이', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayTextLight))),
            Expanded(flex: 2, child: Text('${youInfo.minAge} ~ ${youInfo.maxAge}세', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.main))),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Expanded(flex: 1, child: Text('체형', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayTextLight))),
            Expanded(flex: 2, child: Text(youInfo.bodyShape!.join(', '), style: ThemeFonts.medium.getTextStyle(color: ThemeColors.main))),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Expanded(flex: 1, child: Text('흡연', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayTextLight))),
            Expanded(flex: 2, child: Text(youInfo.isSmoker!, style: ThemeFonts.medium.getTextStyle(color: ThemeColors.main))),
          ],
        ),
      ],
    ),
  ).paddingSymmetric(horizontal: 24);
}