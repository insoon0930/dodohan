import 'package:dodohan/app/data/model/application.dart';
import 'package:dodohan/app/data/model/match.dart';

class AdminMatch {
  final Application? nextWeekManApplication, nextWeekWomanApplication;
  final Match match;
  final String manProfileImage, womanProfileImage;

  AdminMatch({this.nextWeekManApplication,
      this.nextWeekWomanApplication,
      required this.match,
      required this.manProfileImage,
      required this.womanProfileImage});
}
