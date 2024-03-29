import 'package:awesome_select/awesome_select.dart';

import '../enums.dart';

class UnivInfo {
  final String appTitleTail;
  final List<S2Choice<String>> major;
  final Region region;
  final bool isWomanUniv;

  UnivInfo({
    required this.appTitleTail,
    required this.major,
    required this.region,
    this.isWomanUniv = false,
  });
}
