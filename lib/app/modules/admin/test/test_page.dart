import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/appbars/default_appbar.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/theme/fonts.dart';
import 'test_controller.dart';

class TestPage extends GetView<TestController> {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('테스트'),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Flexible(
                child: ElevatedButton(
                  style: BtStyle.standard(height: 100),
                  onPressed: () => controller.updateYouInfoBodyShapeType(),
                  child: Text('youInfo',
                      style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: ElevatedButton(
                  style: BtStyle.standard(height: 100),
                  onPressed: () => controller.updateApplicationBodyShapeType(),
                  child: Text('application',
                      style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Flexible(
                child: ElevatedButton(
                  style: BtStyle.standard(height: 100),
                  onPressed: () => controller.createManApplicationDummy(),
                  child: Text('남자 신청',
                      style:
                      ThemeFonts.medium.getTextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: ElevatedButton(
                  style: BtStyle.standard(height: 100),
                  onPressed: () => controller.createWomanApplicationDummy(),
                  child: Text('여자 신청',
                      style:
                      ThemeFonts.medium.getTextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Flexible(
                child: ElevatedButton(
                  style: BtStyle.standard(height: 100),
                  onPressed: () => controller.updateDefaultCoin(),
                  child: Text('coin',
                      style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
