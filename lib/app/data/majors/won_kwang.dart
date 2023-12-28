
import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorWonKwang = [
  ...['원불교학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '교학대학')).toList(),
  ...['국어국문학과', '영어영문학과', '역사문화학과', '문예창작학과', '중국학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '인문대학')).toList(),
  ...['경영학과', '경제금융학과', '회계세무학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경영대학')).toList(),
  ...['원예산업학과', '식품생명공학과', '식품영양학과', '산림조경학과', '생명환경학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '농식품융합대학')).toList(),
  ...['약학과', '한약학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '약학대학')).toList(),
  ...['국어교육과', '일어교육과', '역사교육과', '유아교육과', '체육교육과', '중등특수교육과', '영어교육과', '한문교육과', '교육학과', '가정교육과', '수학교육과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사범대학')).toList(),
  ...['동물보건학과', '생명과학부', '뷰티디자인학부', '반려동물산업학과', '안전보건학과', '스포츠과학부', '의료상담학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '보건과학대학')).toList(),
  ...['한의예과, 한의학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '한의과대학')).toList(),
  ...['미술과', '시각정보디자인학과', '패션디자인산업학과', '금속·주얼리디자인학과', '실내·산업디자인학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '조형예술디자인대학')).toList(),
  ...['행정ㆍ언론학부', '행정학전공', '신문방송학전공', '가족아동복지학과', '경찰행정학과', '복지ㆍ보건학부', '사회복지학전공', '보건행정학전공', '군사학과', '소방행정학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사회과학대학')).toList(),
  ...['전기공학과', '컴퓨터ㆍ소프트웨어공학과', '기계공학부', '화학공학과', '건설환경공학과', '철도시스템공학부', '전자공학과', '게임콘텐츠학과', '건축공학과(4년제)', '도시공학과', '건축학과(5년제)']
      .map((major) => S2Choice<String>(value: major, title: major, group: '창의공과대학')).toList(),
  ...['치의예과, 치의학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '치과대학')).toList(),
  ...['의예과, 의학과', '작업치료학과', '간호학과', '응급구조학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '의과대학')).toList(),
  ...['국방기술학과', '자율전공학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '독립학과')).toList(),
  ...['교양교육과', '비교과통합센터']
      .map((major) => S2Choice<String>(value: major, title: major, group: '교양교육원')).toList(),
  S2Choice<String>(value: '기타', title: '기타', group: '기타'),
];