import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/dto/admin_application.dart';
import '../../../data/model/user.dart';
import '../../../data/service/application_service/service.dart';
import '../../../data/service/user_service/service.dart';

class AnalyticsController extends GetxController {
  final UserService userService = UserService();
  // final RxList<AdminAnalytics> applications = <AdminAnalytics>[].obs;

  List<dynamic> coinDistributions = const <dynamic>[];
  RxList<PieChartSectionData>? manCoinDistributions = const <PieChartSectionData>[].obs;
  RxList<PieChartSectionData>? womanCoinDistributions = const <PieChartSectionData>[].obs;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    if(user.phoneNum != '+821066192550') {
      Get.offAllNamed(Routes.loginBy);
      return;
    }
    super.onInit();
  }

  Future<void> onTapCoinDistribution() async {
   //todo 블라블라 데이터 들고와서 담기 ㅇㅅㅇ
    final asd = await userService.findUserCoinDistribution();
    print('asdasd@@@@!@@@@@@@@@@@@@@@@@: $asd');
  }
}
