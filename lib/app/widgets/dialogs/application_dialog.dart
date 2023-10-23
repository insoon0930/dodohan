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
          const SizedBox(height: 25),
          Text('신청 상세', style: ThemeFonts.semiBold.getTextStyle(size: 16)),
          const SizedBox(height: 25),
          _meInfo(),
          const Divider(thickness: 1, color: ThemeColors.grayLightest)
              .paddingAll(16),
          _youInfo(),
          const SizedBox(height: 16),
          Text(
            "* 매칭 시, '전화번호'와 '프로필 사진'이 전달됩니다",
            style: ThemeFonts.medium.getTextStyle(color: ThemeColors.greyText, size: 11),
          ),
          ElevatedButton(
            style: BtStyle.standard(),
            onPressed: () => applyClicked(),
            child: const Center(child: Text('신청')),
          ).paddingAll(16)
        ]),
      ),
    );
  }

  Widget _item(String type, String value) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('$type : ', style: ThemeFonts.medium.getTextStyle(size: 14)),
      Text(value, style: ThemeFonts.medium.getTextStyle(size: 14)),
    ],
  ).paddingSymmetric(vertical: 6, horizontal: 16);

  Widget _meInfo() => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Expanded(
                  child: Text('나',
                          textAlign: TextAlign.center,
                          style: ThemeFonts.medium.getTextStyle(size: 14))
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

  Widget _youInfo() => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Expanded(child: Text('이상형', textAlign: TextAlign.center, style: ThemeFonts.medium.getTextStyle(size: 14)).paddingSymmetric(vertical: 6)),
          Expanded(child: _item('동일 학과 배제', youInfo.exceptSameMajor! ? '예' : '아니오')),
        ],
      ),
      Row(
        children: [
          Expanded(child: _item('키', '${youInfo.minHeight} ~ ${youInfo.maxHeight}')),
          Expanded(child: _item('나이', '${youInfo.minAge} ~ ${youInfo.maxAge}')),
        ],
      ),
      Row(
        children: [
          Expanded(child: _item('체형', youInfo.bodyShape!.join(', '))),
          Expanded(child: _item('흡연', youInfo.isSmoker!)),
        ],
      ),
    ],
  );
}