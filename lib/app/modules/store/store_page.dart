import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stamp_now/core/utils/utility.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../widgets/appbars/default_appbar.dart';
import 'js_helper/js_helper_web.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('스토어'),
      body: Stack(
        children: [
          Container(color: ThemeColors.mainLightest),
          Column(
            children: [
              _purchaseItem(5, 5900),
              Stack(children: [
                _purchaseItem(10, 10900),
                Positioned(
                    right: 18,
                    top: 18,
                    child: _itemTag('인기', colors: [
                      const Color(0xffba09f9),
                      const Color(0xff7309f9)
                    ]))
              ]),
              Stack(children: [
                _purchaseItem(20, 18900),
                Positioned(
                    right: 18,
                    top: 18,
                    child: _itemTag('실속', colors: [
                      const Color(0xfff9d109),
                      const Color(0xfff9a909)
                    ]))
              ]),
              // TossPayments(
              //   clientKey: 'test_ck_AQ92ymxN349YG91NZoAVajRKXvdk',
              //   data: PaymentData(
              //       paymentMethod: '카드',
              //       orderId: 'tosspayments-202303210239',
              //       orderName: 'toss t-shirt',
              //       amount: 50000,
              //       customerName: '김토스',
              //       customerEmail: 'toss@toss-payments.co.kr'),
              //   success: (Success success) {
              //     Get.back(result: success);
              //   },
              //   fail: (Fail fail) {
              //     Get.back(result: fail);
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _purchaseItem(int coinNum, int price) {
    String formattedPrice =
        NumberFormat.currency(locale: 'ko_KR', symbol: '₩').format(price);
    return GestureDetector(
      onTap: () async {
        final JSHelper jsHelper = JSHelper();
        await jsHelper.callJSPromise(
            amount: price,
            orderId: '${DateTime.now().millisecond}_${Utility.randomString(8)}',
            orderName: '하트 $coinNum개');
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/love.svg', color: Colors.redAccent)
                    .paddingSymmetric(horizontal: 16),
                Text('$coinNum', style: ThemeFonts.semiBold.getTextStyle()),
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
