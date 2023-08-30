import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/fonts.dart';
import '../../../core/theme/paddings.dart';
import '../../data/info_data.dart';
import '../../widgets/appbars/default_appbar.dart';
import '../../widgets/multi_selector.dart';
import '../../widgets/single_selector.dart';
import 'daily_card_controller.dart';

class DailyCardPage extends GetView<DailyCardController> {
  const DailyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('나'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ElevatedButton(
              style: BtStyle.standard(),
              onPressed: () {},
              child: Center(
                child: Text('저장',
                    style:
                    ThemeFonts.medium.getTextStyle(color: Colors.white)),
              ),
            ).paddingSymmetric(horizontal: 16)
          ],
        ),
      ),
    );
  }
}
