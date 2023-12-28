
import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorChoSun = [
  ...['영어영문학과', '역사문화학과', '문예창작학과', '일본어과', '아시아언어문화학부', '유럽언어문화학부', '글로벌비즈니스커뮤니케이션학과', 'K-컬쳐공연·기획학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '글로벌인문대학')).toList(),
  ...['컴퓨터통계학과', '화학과', '생명과학과', '의생명과학과', '식품영양학과', '경찰행정학과', '상담심리학과', '언어치료학과', '소방재난관리학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '자연과학·공공보건안전대학')).toList(),
  ...['법학과', '공공인재법무학과', '행정복지학부', '정치외교학과', '신문방송학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '법사회대학')).toList(),
  ...['경영학부', '경제학과', '무역학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경상대학')).toList(),
  ...['토목공학과', '건축공학과', '기계공학과', '스마트이동체융합시스템공학부', '생명화학공학과', '신소재공학과', '산업공학과', '전기공학과', '광기술공학과', '환경공학과', '원자력공학과', '용접·접합과학공학과', '첨단에너지공학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '공과대학')).toList(),
  ...['전자공학부', '컴퓨터공학과', '정보통신공학부', '인공지능학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: 'IT융합대학	')).toList(),
  ...['문화콘텐츠학부', '라이프스타일디자인학부', '시각디자인학과', '디자인공학과', '체육학과', '스포츠산업학과', '태권도학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '미술체육대학')).toList(),
  S2Choice<String>(value: '기타', title: '기타', group: '기타'),
];