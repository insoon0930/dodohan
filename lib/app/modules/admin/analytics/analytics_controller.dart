
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../core/theme/colors.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/model/user.dart';
import '../../../data/service/user_service/service.dart';

class AnalyticsController extends GetxController {
  final UserService userService = UserService();
  // final RxList<AdminAnalytics> applications = <AdminAnalytics>[].obs;

  List<dynamic> coinDistributions = const <dynamic>[];
  RxList<PieChartSectionData> manCoinDistributions = <PieChartSectionData>[].obs;
  RxList<PieChartSectionData> womanCoinDistributions = <PieChartSectionData>[].obs;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    if(!AuthService.to.isAdmin) {
      Get.offAllNamed(Routes.loginBy);
      return;
    }
    super.onInit();
  }

  Future<void> onTapManCoinDistribution() async {
    List<int> manCoinDistribution = await userService.findManCoinDistribution();
    print('manCoinDistribution: $manCoinDistribution');
    manCoinDistributions.value = List.generate(5, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: ThemeColors.blueLight,
            value: manCoinDistribution[i].toDouble(),
            title: '0~5 (${manCoinDistribution[i]})',
          );
        case 1:
          return PieChartSectionData(
            color: ThemeColors.yellowLight,
            value: manCoinDistribution[i].toDouble(),
            title: '6~9 (${manCoinDistribution[i]})',
          );
        case 2:
          return PieChartSectionData(
            color: ThemeColors.grayDark,
            value: manCoinDistribution[i].toDouble(),
            title: '10 (${manCoinDistribution[i]})',
          );
        case 3:
          return PieChartSectionData(
            color: ThemeColors.greenLight,
            value: manCoinDistribution[i].toDouble(),
            title: '11~20 (${manCoinDistribution[i]})',
          );
        case 4:
          return PieChartSectionData(
            color: ThemeColors.pinkLight,
            value: manCoinDistribution[i].toDouble(),
            title: '21~100 (${manCoinDistribution[i]})',
          );
        default:
          throw Error();
      }
    });
  }

  Future<void> onTapWomanCoinDistribution() async {
    List<int> womanCoinDistribution = await userService.findWomanCoinDistribution();
    print('womanCoinDistribution: $womanCoinDistribution');
    womanCoinDistributions.value = List.generate(5, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: ThemeColors.blueLight,
            value: womanCoinDistribution[i].toDouble(),
            title: '0~5 (${womanCoinDistribution[i]})',
          );
        case 1:
          return PieChartSectionData(
            color: ThemeColors.yellowLight,
            value: womanCoinDistribution[i].toDouble(),
            title: '6~9 (${womanCoinDistribution[i]})',
          );
        case 2:
          return PieChartSectionData(
            color: ThemeColors.grayDark,
            value: womanCoinDistribution[i].toDouble(),
            title: '10 (${womanCoinDistribution[i]})',
          );
        case 3:
          return PieChartSectionData(
            color: ThemeColors.greenLight,
            value: womanCoinDistribution[i].toDouble(),
            title: '11~20 (${womanCoinDistribution[i]})',
          );
        case 4:
          return PieChartSectionData(
            color: ThemeColors.pinkLight,
            value: womanCoinDistribution[i].toDouble(),
            title: '21~100 (${womanCoinDistribution[i]})',
          );
        default:
          throw Error();
      }
    });
  }
}
