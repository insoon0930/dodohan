import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stamp_now/core/utils/utility.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/appbars/default_appbar.dart';
import 'js_helper/js_helper_web.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('스토어', actions: [const Text('이용 내역').paddingOnly(right:16)]),
      body: Stack(
        children: [
          Container(color: ThemeColors.mainLightest),
          Column(
            children: [
              _purchaseItem(coin: 3, price: 3900, promotion: 0),
              _purchaseItem(coin: 5, price: 5900, promotion: 1),
              Stack(children: [
                _purchaseItem(coin: 10, price: 10900, promotion: 2),
                Positioned(
                    right: 18,
                    top: 18,
                    child: _itemTag('인기', colors: [
                      const Color(0xffba09f9),
                      const Color(0xff7309f9)
                    ]))
              ]),
              Stack(children: [
                _purchaseItem(coin: 20, price: 18900, promotion: 4),
                Positioned(
                    right: 18,
                    top: 18,
                    child: _itemTag('실속', colors: [
                      const Color(0xfff9d109),
                      const Color(0xfff9a909)
                    ]))
              ]),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () => Get.toNamed(Routes.termsOfUse),
                  child: const Text('이용약관',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _purchaseItem({required int coin, required int price, required int promotion}) {
    String formattedPrice =
        NumberFormat.currency(locale: 'ko_KR', symbol: '₩').format(price);
    return GestureDetector(
      onTap: () async {
        final JSHelper jsHelper = JSHelper();
        await jsHelper.callJSPromise(
            amount: price,
            orderId: '${DateTime.now().millisecond}_${Utility.randomString(8)}',
            orderName: '하트 ${coin + promotion}개');
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/love.svg', color: Colors.redAccent).paddingSymmetric(horizontal: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${coin + promotion}개', style: ThemeFonts.semiBold.getTextStyle()),
                    if(promotion != 0)
                      Row(
                        children: [
                          Text('$coin', style: ThemeFonts.medium.getTextStyle(size: 11)),
                          Text(' +$promotion 추가', style: ThemeFonts.medium.getTextStyle(size: 11, color: ThemeColors.blueLight)),
                        ],
                      ).paddingOnly(top: 4),
                  ],
                ),
              ],
            ),
            Text(formattedPrice, style: ThemeFonts.semiBold.getTextStyle())
                .paddingOnly(right: 16),
          ],
        ).paddingSymmetric(vertical: 16),
      ),
    );
  }

  Widget _itemTag(String text, {required List<Color> colors}) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 15,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              gradient: LinearGradient(
                  begin: const Alignment(1, 1),
                  end: const Alignment(0, 0),
                  colors: colors)),
          child: Center(
            child: Text(text,
                style: ThemeFonts.bold
                    .getTextStyle(color: Colors.white, size: 10)),
          ),
        ),
      ],
    );
  }
}
