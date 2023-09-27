import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stamp_now/app/modules/store/history/history_controller.dart';
import 'package:stamp_now/core/utils/utility.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/model/coin_receipt.dart';
import '../../../widgets/appbars/default_appbar.dart';
import '../js_helper/js_helper_web.dart';

class StoreHistoryPage extends GetView<StoreHistoryController> {
  const StoreHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('이용 내역'),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.coinReceipts.length,
                itemBuilder: (BuildContext context, int index) =>
                    _purchaseItem(controller.coinReceipts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _purchaseItem(CoinReceipt receipt) {
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
}
