import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/widgets/appbars/default_appbar.dart';
import '../../../../core/theme/fonts.dart';
import 'match_controller.dart';
import '../../../data/model/match.dart';

class MatchPage extends GetView<MatchController> {
  const MatchPage({super.key});
  //todo user, application 이렇게 두개 필요함 ㅇㅇ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('프로필 이미지 심사'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
                  () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.matches.length,
                itemBuilder: (BuildContext context, int index) => _listIem(controller.matches[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listIem(Match item) => SizedBox(
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            // ImageViewBox(url: item.preProfileImage),
            Text('기존', style: ThemeFonts.medium.getTextStyle())
              ],
        ),
        Column(
          children: [
            // ImageViewBox(url: item.newProfileImage),
            Text('신청', style: ThemeFonts.medium.getTextStyle())
          ],
        ),
      ],
    ),
  );
}
