import 'package:awesome_select/awesome_select.dart';

class Utils {
  static List<S2Choice<String>> major = [
    S2Choice<String>(value: '건축학부', title: '건축학부', group: '공과대학'),
    S2Choice<String>(value: '건축공학부', title: '건축공학부', group: '공과대학'),
    S2Choice<String>(value: '건설환경공학부', title: '건설환경공학부', group: '공과대학'),
    S2Choice<String>(value: '도시공학과', title: '도시공학과', group: '공과대학'),
    S2Choice<String>(value: '자원환경공학과', title: '자원환경공학과', group: '공과대학'),
    S2Choice<String>(value: '융합전자공학부', title: '융합전자공학부', group: '공과대학'),
    S2Choice<String>(value: '의예과', title: '의예과', group: '의과대학'),
    S2Choice<String>(value: '의학과', title: '의학과', group: '의과대학'),
  ];

  static List<S2Choice<String>> height = List.generate(
      50, (index) => S2Choice<String>(value: '${140 + index}', title: '${140 + index}'));

  static List<S2Choice<String>> age = List.generate(
      20, (index) => S2Choice<String>(value: '${20 + index}', title: '${20 + index}'));

  static List<S2Choice<String>> meBodyShapeForMan = [
    S2Choice<String>(value: '마른', title: '마른'),
    S2Choice<String>(value: '보통', title: '보통'),
    S2Choice<String>(value: '통통', title: '통통'),
    S2Choice<String>(value: '근육있는', title: '근육있는'),
  ];

  static List<S2Choice<String>> youBodyShapeForMan = [
    ...meBodyShapeForWoman,
    S2Choice<String>(value: '상관없음', title: '상관없음'),
  ];

  static List<S2Choice<String>> meBodyShapeForWoman = [
    S2Choice<String>(value: '마른', title: '마른'),
    S2Choice<String>(value: '보통', title: '보통'),
    S2Choice<String>(value: '통통', title: '통통'),
    S2Choice<String>(value: '볼륨있는', title: '볼륨있는'),
  ];

  static List<S2Choice<String>> youBodyShapeForWoman = [
    ...meBodyShapeForMan,
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
}
