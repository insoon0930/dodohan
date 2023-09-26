
import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorKonKuk = [
  ...['국어국문학', '영어영문학', '중어중문학', '철학', '사학', '지리학과', '미디어커뮤니케이션학과', '문화콘텐츠학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '문과대학')).toList(),
  ...['수학과', '물리학과', '화학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '이과대학')).toList(),
  S2Choice<String>(value: '건축학부', title: '건축학부', group: '건축대학'),
  ...['사회환경공학부', '기계항공공학부', '전기전자공학부', '화학공학부', '컴퓨터공학부', '산업경영공학부 산업공학과', '산업경영공학부 신산업융합학과', '생물공학과', 'K뷰티산업융합학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '공과대학')).toList(),
  ...['정치외교학과', '경제학과', '행정학과', '국제무역학과', '응용통계학과', '융합인재학과', '글로벌비즈니스학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사회과학대학')).toList(),
  ...['경영학과', '기술경영학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경영대학')).toList(),
  S2Choice<String>(value: '부동산학과', title: '부동산학과', group: '부동산과학원'),
  ...['미래에너지공학과', '스마트운행체공학과', '스마트ICT융합공학과', '화장품공학과', '줄기세포재생공학과', '의생명공학과', '시스템생명공학과', '융합생명공학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: 'KU융합과학기술원')).toList(),
  ...['생명과학특성학과', '동물자원과학과', '식량자원과학과', '축산식품생명공학과', '식품유통공학과', '환경보건과학과', '산림조경학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '상허생명과학대학')).toList(),
  ...['수의예과', '수의학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '수의과대학')).toList(),
  ...['커뮤니케이션디자인학과', '산업디자인학과', '의상디자인학과', '리빙디자인학과', '현대미술학과', '영상영화학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '예술디자인대학')).toList(),
  ...['일어교육과', '수학교육과', '체육교육과', '음악교육과', '교육공학과', '영어교육과', '교직과/대학원교육학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사범대학')).toList(),
  ...['행정실', '교양교육센터', '교양연구평가센터', '사회봉사센터', '국제학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '상허교양대학')).toList(),
  S2Choice<String>(value: '기타', title: '기타', group: '기타'),
];