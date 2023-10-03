import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stamp_now/app/modules/store/history/history_controller.dart';
import 'package:stamp_now/core/utils/time_utility.dart';
import 'package:stamp_now/core/utils/utility.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/model/coin_receipt.dart';
import '../../../widgets/appbars/default_appbar.dart';
// import '../js_helper/js_helper_web.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/love.svg', color: Colors.redAccent),
            if(receipt.isCharge)
              Text('+${receipt.amount}', style: ThemeFonts.semiBold.getTextStyle(color: ThemeColors.blueLight)).paddingOnly(left: 4, right: 8),
            if(receipt.isConsume)
              Text('-${receipt.amount}', style: ThemeFonts.semiBold.getTextStyle(color: ThemeColors.redLight)).paddingOnly(left: 4, right: 8),
            //todo enum 구체화
            Text(receipt.type.name, style: ThemeFonts.semiBold.getTextStyle()),
          ],
        ),
        Text(TimeUtility.formatDateSimple(receipt.createdAt!), style: ThemeFonts.semiBold.getTextStyle()),
      ],
    ).paddingSymmetric(vertical: 16);
  }
}
