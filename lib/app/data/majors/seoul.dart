
import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorSeoul = [
  ...['행정학과', '국제관계학과', '경제학부', '사회복지학과', '세무학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '정경대학')).toList(),
  ...['경영학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경영대학')).toList(),
  ...['전자전기컴퓨터공학부', '컴퓨터과학부', '화학공학과', '기계정보공학과', '신소재공학과', '토목공학과', '인공지능학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '공과대학')).toList(),
  ...['영어영문학과', '국어국문학과', '국사학과', '철학과', '중국어문화학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '인문대학')).toList(),
  ...['수학과', '통계학과', '물리학과', '생명과학과', '환경원예학과', '융합응용화학과', '', '', '', '', '', '', '', '']
      .map((major) => S2Choice<String>(value: major, title: major, group: '자연과학대학')).toList(),
  ...['건축학부(건축공학)', '건축학부(건축학)', '도시공학과', '교통공학과', '조경학과', '도시행정학과', '도시사회학과', '공간정보공학과', '환경공학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '도시과학대학')).toList(),
  ...['음악학과', '디자인학과', '환경조각학과', '스포츠과학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '예술체육대학')).toList(),
  ...['자유전공학부', '융합전공학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '자유융합대학')).toList(),
  S2Choice<String>(value: '기타', title: '기타', group: '기타'),
];