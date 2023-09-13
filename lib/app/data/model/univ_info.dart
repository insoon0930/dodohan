import 'package:awesome_select/awesome_select.dart';

class UnivInfo {
  final String appTitleTail;
  final List<S2Choice<String>> major;
  final bool isForFree;

  UnivInfo({
    required this.appTitleTail,
    required this.major,
    required this.isForFree,
  });
}
