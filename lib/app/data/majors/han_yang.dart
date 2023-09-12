
import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorHanYang = [
  ...['반도체공학과', '건축학부', '건축공학부', '건설환경공학부', '도시공학과', '자원환경공학과', '융합전자공학부', '전기생체공학부', '신소재공학부', '화학공학과', '생명공학과', '유기나노공학과', '에너지공학과', '기계공학부', '원자력공학과', '산업공학과',]
      .map((major) => S2Choice<String>(value: major, title: major, group: '공과대학')).toList(),
  ...['데이터사이언스학부', '컴퓨터소프트웨어학부', '정보시스템학과', '미래자동차공학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '소프트웨어대학')).toList(),
  ...['의예과', '의학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '의과대학')).toList(),
  ...['국어국문학과', '중어중문학과', '영어영문학과', '독어독문학과', '사학과', '철학과', '미래인문학융합학부', '대중문화·시나리오 학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '인문과학대학')).toList(),
  ...['정치외교학과', '사회학과', '미디어커뮤니케이션학과', '관광학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사회과학대학')).toList(),
  ...['수학과', '물리학과', '화학과', '생명과학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '자연과학대학')).toList(),
  ...['정책학과', '행정학과', '과학기술정책학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '정책과학대학')).toList(),
  ...['경제금융대학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경제금융대학')).toList(),
  ...['경영학부', '파이낸스경영학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경영대학')).toList(),
  ...['교육학과', '교육공학과', '국어교육과', '영어교육과', '수학교육과', '응용미술교육과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사범대학')).toList(),
  ...['의류학과', '식품영양학과', '실내건축디자인학과', '기능성식품학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '생활과학대학')).toList(),
  ...['성악과', '작곡과', '피아노과', '관현악과', '국악과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '음악대학')).toList(),
  ...['스포츠산업과학부', '연극영화학과', '무용학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '예술/체육대학')).toList(),
  S2Choice<String>(value: '국제학부', title: '국제학부', group: '국제학부'),
  S2Choice<String>(value: '간호대학', title: '간호대학', group: '간호대학'),
  S2Choice<String>(value: '산업융합학부', title: '산업융합학부', group: '산업융합학부'),
  S2Choice<String>(value: '기타', title: '기타', group: '기타'),
  S2Choice<String>(value: '한양여대', title: '한양여대', group: '한양여대'),
];