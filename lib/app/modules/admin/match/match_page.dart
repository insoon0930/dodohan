import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/dto/admin_match.dart';
import 'package:dodohan/app/widgets/appbars/default_appbar.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/enums.dart';
import '../../../widgets/image/image_view_box.dart';
import 'match_controller.dart';
import '../../../data/model/match.dart';

class MatchPage extends GetView<MatchController> {
  const MatchPage({super.key});
  //todo user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('매치'),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.matchProfiles.length,
                itemBuilder: (BuildContext context, int index) => _listIem(controller.matchProfiles[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listIem(AdminMatch item) => SizedBox(
    width: Get.width,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(children: [
                  ImageViewBox(url: item.manProfileImage),
                  if (item.match.manStatus == MatchStatus.confirmed)
                    Positioned.fill(
                      child: Container(
                          color: ThemeColors.blueLight.withOpacity(0.3),
                          child: const Text('수락')),
                    ),
                  if (item.match.manStatus == MatchStatus.rejected)
                    Positioned.fill(
                      child: Container(
                          color: ThemeColors.redLight.withOpacity(0.3),
                          child: const Text('거절')),
                    ),
                  if (item.match.manStatus == MatchStatus.checked)
                    Positioned.fill(
                      child: Container(
                          color: Colors.transparent, child: const Text('미확인')),
                    ),
                  if (item.match.manStatus == MatchStatus.unChecked)
                    Positioned.fill(
                      child: Container(
                        color: ThemeColors.grayLightest.withOpacity(0.3),
                        child: const Text('확인')),
                    ),
                  Positioned(bottom: 10, child: Text(item.nextWeekManApplication == null ? '' : '신청함'))
                ]),
            Stack(children: [
              ImageViewBox(url: item.womanProfileImage),
              if (item.match.womanStatus == MatchStatus.confirmed)
                Positioned.fill(
                  child: Container(
                      color: ThemeColors.blueLight.withOpacity(0.3),
                      child: const Text('수락')),
                ),
              if (item.match.womanStatus == MatchStatus.rejected)
                Positioned.fill(
                  child: Container(
                      color: ThemeColors.redLight.withOpacity(0.3),
                      child: const Text('거절')),
                ),
              if (item.match.womanStatus == MatchStatus.checked)
                Positioned.fill(
                  child: Container(
                      color: Colors.transparent, child: const Text('미확인')),
                ),
              if (item.match.womanStatus == MatchStatus.unChecked)
                Positioned.fill(
                  child: Container(
                    color: ThemeColors.grayLightest.withOpacity(0.3),
                    child: const Text('확인')),
                ),
              Positioned(bottom: 10, child: Text(item.nextWeekWomanApplication == null ? '' : '신청함'))
            ]),
          ],
        ),
        Text('${item.match.createdAt}')
      ],
    ),
  ).paddingSymmetric(vertical: 4);
}
