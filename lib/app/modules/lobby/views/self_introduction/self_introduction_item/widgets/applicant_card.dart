import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../data/enums.dart';
import '../../../../../../data/model/self_application.dart';
import '../../../../../../widgets/image/image_view_box.dart';

class ApplicantCard extends StatelessWidget {
  final SelfApplication selfApplication;

  const ApplicantCard({super.key, required this.selfApplication});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0))),
      elevation: 3,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageViewBox(
                    url: selfApplication.profileImage,
                    borderRadius: 8,
                    width: (Get.width - 36) / 2 - 16,
                    height: (Get.width - 36) / 2 - 16)
              ],
            ),
          ),
          if (selfApplication.status == SelfApplicationStatus.closed)
            _cardCover(),
          if (selfApplication.status == SelfApplicationStatus.openedByApplicant)
            Positioned(top: 8, right: 8, child: _tag()),
        ],
      ),
    );
  }

  Widget _cardCover() => Positioned.fill(
      child: Card(
          color: ThemeColors.main,
          margin: const EdgeInsets.all(4.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          elevation: 0,
          child: SvgPicture.asset('assets/love.svg',
              color: ThemeColors.mainLightest)
              .paddingAll((Get.width - 64) / 7)));

  Widget _tag() {
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: ThemeColors.orangeLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text('프리미엄 신청',
          style: ThemeFonts.medium.getTextStyle(color: Colors.white, size: 10),
          textAlign: TextAlign.center)
          .paddingSymmetric(horizontal: 7, vertical: 1),
    );
  }
}