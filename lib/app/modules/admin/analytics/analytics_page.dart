import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/appbars/default_appbar.dart';
import '../../../../core/theme/colors.dart';
import 'analytics_controller.dart';

class AnalyticsPage extends GetView<AnalyticsController> {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('이번주 신청'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Obx(
                  ()=> Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => controller.onTapManCoinDistribution(), child: const Text('코인 분포(남)')),
                      if(controller.manCoinDistributions.isNotEmpty)
                        AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              centerSpaceRadius: 60,
                              sections: controller.manCoinDistributions,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => controller.onTapWomanCoinDistribution(), child: const Text('코인 분포(여)')),
                      if(controller.womanCoinDistributions.isNotEmpty)
                        AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              centerSpaceRadius: 60,
                              sections: controller.womanCoinDistributions,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            // ElevatedButton(onPressed: () {}, child: const Text('결제')),
            // ElevatedButton(onPressed: () {}, child: const Text('캠퍼스')),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: ThemeColors.blueLight,
            value: 40,
            title: '40%',
          );
        case 1:
          return PieChartSectionData(
            color: ThemeColors.yellowLight,
            value: 30,
            title: '30%',
          );
        case 2:
          return PieChartSectionData(
            color: ThemeColors.greenLight,
            value: 15,
            title: '15%',
          );
        case 3:
          return PieChartSectionData(
            color: ThemeColors.pinkLight,
            value: 15,
            title: '15%',
          );
        default:
          throw Error();
      }
    });
  }
}
