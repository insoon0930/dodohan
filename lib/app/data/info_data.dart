import 'package:awesome_select/awesome_select.dart';
import 'package:stamp_now/app/data/majors/chung_ang.dart';
import 'package:stamp_now/app/data/model/univ_info.dart';

import 'majors/han_yang.dart';
import 'majors/hufs.dart';
import 'majors/kon_kuk.dart';
import 'majors/seoul.dart';
import 'majors/yon_sei.dart';

class InfoData {

  static Map<String, UnivInfo> univInfo = {
    '한양대': UnivInfo(appTitleTail: '한양', major: majorHanYang, isForFree: true),
    '중앙대(서울)': UnivInfo(appTitleTail: '중앙', major: majorChungAng, isForFree: true),
    '중앙대(안성)': UnivInfo(appTitleTail: '중앙', major: majorChungAng, isForFree: true),
    '연세대(신촌)': UnivInfo(appTitleTail: '연세', major: majorYonSei, isForFree: true),
    // '건국대(서울)': UnivInfo(appTitleTail: '건국', major: majorKonKuk, isForFree: true),
    // '한국외대(서울)': UnivInfo(appTitleTail: '외대', major: majorHUFS, isForFree: true),
    '서울시립대': UnivInfo(appTitleTail: '시립', major: majorSeoul, isForFree: true),
  };

  static List<String> univ = ['선택', ...InfoData.univInfo.keys.toList()];

  static List<S2Choice<String>> height = List.generate(
      50, (index) => S2Choice<String>(value: '${140 + index}', title: '${140 + index}'));

  static List<S2Choice<String>> age = List.generate(
      10, (index) => S2Choice<String>(value: '${20 + index}', title: '${20 + index}'));

  static List<S2Choice<String>> manBodyShape = [
    S2Choice<String>(value: '마른', title: '마른'),
    S2Choice<String>(value: '보통', title: '보통'),
    S2Choice<String>(value: '통통', title: '통통'),
    S2Choice<String>(value: '근육있는', title: '근육있는'),
  ];

  static List<S2Choice<String>> womanBodyShape = [
    S2Choice<String>(value: '마른', title: '마른'),
    S2Choice<String>(value: '보통', title: '보통'),
    S2Choice<String>(value: '통통', title: '통통'),
    S2Choice<String>(value: '볼륨있는', title: '볼륨있는'),
  ];

  static List<S2Choice<String>> meSmoke = [
    S2Choice<String>(value: 'true', title: '흡연'),
    S2Choice<String>(value: 'false', title: '비흡연'),
  ];

  static List<S2Choice<String>> youSmoke = [
    S2Choice<String>(value: '흡연', title: '흡연'),
    S2Choice<String>(value: '비흡연', title: '비흡연'),
    S2Choice<String>(value: '상관없음', title: '상관없음'),
  ];

  static List<S2Choice<String>> exceptSameMajor = [
    S2Choice<String>(value: 'true', title: '배제함'),
    S2Choice<String>(value: 'false', title: '상관없음'),
  ];

}
