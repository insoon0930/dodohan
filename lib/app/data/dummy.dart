import 'package:awesome_select/awesome_select.dart';

import 'model/me_info.dart';
import 'model/you_info.dart';

class Dummy {
  static MeInfo manMeInfo = MeInfo(
      id: 'xpnekRl9TgNyFGKlayky',
      age: 27,
      bodyShape: '근육있는',
      height: 178,
      isMan: true,
      isSmoker: false,
      major: '건축공학부',
      univ: '한양대',
      user: '6BqgdRdFUoZOPclxIzbD');

  static YouInfo manYouInfo = YouInfo(
      id: 'aD1rVw5AQ8E0jYGR9Hwv',
      bodyShape: ['상관없음'],
      exceptSameMajor: false,
      isSmoker: '상관없음',
      maxAge: 38,
      minAge: 20,
      maxHeight: 186,
      minHeight: 140,
      univ: '한양대',
      user: '6BqgdRdFUoZOPclxIzbD');

  static MeInfo womanMeInfo = MeInfo(
      id: 'C9XrDWGaH3ZKnUZ9salr',
      age: 24,
      bodyShape: '보통',
      height: 165,
      isMan: false,
      isSmoker: false,
      major: '건축학부',
      univ: '한양대',
      user: 'WdIHlWaTUAitbexvmW5E');

  static YouInfo womanYouInfo = YouInfo(
      id: 'nOLlvm3pTxJ97AaScDrj',
      bodyShape: ['마른'],
      exceptSameMajor: true,
      isSmoker: '비흡연',
      maxAge: 19,
      minAge: 18,
      maxHeight: 140,
      minHeight: 120,
      univ: '한양대',
      user: 'WdIHlWaTUAitbexvmW5E');
}
