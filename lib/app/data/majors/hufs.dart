
import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorHUFS = [
  ...['ELLT(구 영어학과)', '영미문학·문화학과', 'EICC학과(구 영어통번역학과)', '영어학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '영어대학')).toList(),
  ...['프랑스어학부', '독일어과', '노어과', '스페인어과', '이탈리아어과', '포르투갈어과', '네덜란드어과', '스칸디나비아어과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '서양어대학')).toList(),
  ...['말레이·인도네시아어과', '아랍어과', '태국어과', '베트남어과', '인도어과', '터키·아제르바이잔어과', '페르시아어·이란학과', '몽골어과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '아시아언어문화대학')).toList(),
  ...['중국언어문화학부', '중국외교통상학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '중국학대학')).toList(),
  ...['일본언어문화학부', '융합일본지역학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '일본학대학')).toList(),
  ...['정치외교학과', '행정학과', '미디어커뮤니케이션 학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사회과학대학')).toList(),
  ...['국제통상학과', '경제학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '상경대학')).toList(),
  ...['경영학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경영대학')).toList(),
  ...['영어교육과', '프랑스어교육과', '독일어교육과', '한국어교육과', '중국어교육과', '교육학전공', '체육학전공']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사범대학')).toList(),
  ...['Language & AI융합학부', 'Social Science & AI융합학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: 'AI융합대학')).toList(),
  ...['국제학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '국제학부')).toList(),
  ...['LD전공', '사회과학전공']
      .map((major) => S2Choice<String>(value: major, title: major, group: 'LD학부')).toList(),
  ...['LT학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: 'LT학부')).toList(),
  ...['외국어로서의 한국어교육 전공', '외국어로서의 한국어통번역 전공']
      .map((major) => S2Choice<String>(value: major, title: major, group: 'KFL학부')).toList(),
  S2Choice<String>(value: '기타', title: '기타', group: '기타'),
];