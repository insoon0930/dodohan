import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../widgets/appbars/default_appbar.dart';
import '../../../widgets/my_divider.dart';

class BusinessInfoPage extends StatelessWidget {
  const BusinessInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('사업자 정보'),
      body: Column(
        children: [
          _listItem('상호', '(별이) Byul E'),
          _listItem('주소', '부산광역시 동래구 충렬대로 487'),
          _listItem('사업자 등록번호', '524-28-01299'),
          _listItem('대표자명', '최인창'),
          _listItem('유선전화번호', '010-6619-2550'),
          _listItem('통신판매 신고번호', '2022-부산동래-0049'),
        ],
      ),
    );
  }

  Widget _listItem(String category, String text) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          SizedBox(
              width: 150,
              child: Text(category, style: ThemeFonts.medium.getTextStyle())
                  .paddingOnly(left: 16)),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    text,
                    style: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayLightest),
                  ),
                  const Spacer(),
                  const Divider(height: 0,),
                ],
              )),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
