import 'package:dodohan/core/theme/buttons.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:dodohan/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/appbars/default_appbar.dart';
import 'receipt_controller.dart';

class ReceiptPage extends GetView<ReceiptController> {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('영수증 관리'),
      body: Obx(
        () => Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (String newValue) => controller.phoneNum.value = newValue,
                    style: ThemeFonts.medium.getTextStyle(),
                    maxLength: 13,
                    keyboardType: TextInputType.phone,
                    autofocus: true,
                    inputFormatters: [MaskedInputFormatter('###-####-####')],
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '010-1234-5678',
                      hintStyle: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayText),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      style: BtStyle.standard(color: ThemeColors.mainLight),
                      onPressed: () => controller.findOneByUserId(controller.phoneNum.value),
                      child: Text('검색', style: ThemeFonts.medium.getTextStyle(color: Colors.white))),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text('id: ${controller.targetUser.value?.id??'-'}'),
            Text('coin: ${controller.targetUser.value?.coin??'-'}'),
            Text('phoneNum: ${controller.targetUser.value?.phoneNum??'-'}'),
            Text('isAndroid: ${controller.targetUser.value?.isAndroid??'-'}'),
            const SizedBox(height: 10),
            Text('결제 영수증', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.mainLight)),
            Expanded(
              child: ListView.builder(
                itemCount: controller.receipts.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Text('index: $index', style: ThemeFonts.medium.getTextStyle()),
                    Text('createdAt: ${controller.receipts[index].createdAt}', style: ThemeFonts.medium.getTextStyle()),
                    Text('amount: ${controller.receipts[index].amount}', style: ThemeFonts.medium.getTextStyle()),
                    Text('purchaseToken: ${controller.receipts[index].purchaseToken?.substring(0, 30)??'-'}', style: ThemeFonts.medium.getTextStyle()),
                  ],
                ).paddingSymmetric(vertical: 10))),
            const SizedBox(height: 10),
            Text('코인 영수증', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.mainLight)),
            Expanded(
                child: Obx(
                  () => ListView.builder(
                      itemCount: controller.coinReceipts.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Text('index: $index', style: ThemeFonts.medium.getTextStyle()),
                          Text('createdAt: ${controller.coinReceipts[index].createdAt}', style: ThemeFonts.medium.getTextStyle()),
                          Text('amount: ${controller.coinReceipts[index].amount}', style: ThemeFonts.medium.getTextStyle()),
                          Text('type: ${controller.coinReceipts[index].type}', style: ThemeFonts.medium.getTextStyle()),
                        ],
                      ).paddingSymmetric(vertical: 10)),
                )),
            const SizedBox(height: 10),
            if(controller.targetUser.value != null)
              Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (String newValue) => controller.amount.value = int.parse(newValue),
                    style: ThemeFonts.medium.getTextStyle(),
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '지급 할 코인 수 입력',
                      hintStyle: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayText),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      style: BtStyle.standard(color: ThemeColors.mainLight),
                      onPressed: () => controller.increaseUserCoin(controller.targetUser.value!.id, controller.amount.value),
                      child: Text('지급', style: ThemeFonts.medium.getTextStyle(color: Colors.white))),
                )
              ],
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
