import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorChungAng = [
  ...['국어국문학과', '영어영문학과', '유럽문화학부', '아시아문화학부', '철학과', '역사학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '인문대학')).toList(),
  ...['정치국제학과', '공공인재학부', '심리학과', '문헌정보학과', '사회복지학부', '미디어커뮤니케이션학부', '도시계획·부동산학과', '사회학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사회과학대학')).toList(),
  ...['교육학과', '유아교육과', '영어교육과', '체육교육과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사범대학')).toList(),
  ...['물리학과', '화학과', '생명과학과', '수학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '자연과학대학')).toList(),
  ...['생명자원공학부', '식품공학부', '시스템생명공학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '생명공학대학')).toList(),
  ...['사회기반시스템공학부', '건축학부', '화학신소재공학부', '기계공학부', '에너지시스템공학부', '첨단소재공학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '공과대학')).toList(),
  ...['전자전기공학부', '융합공학부', '차세대반도체학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '창의ICT공과대학')).toList(),
  ...['소프트웨어학부', 'AI학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '소프트웨어대학')).toList(),
  ...['경영학부', '경제학부', '응용통계학과', '광고홍보학과', '국제물류학과', '지식경영학부', '산업보안학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경영경제대학')).toList(),
  ...['의학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '의과대학')).toList(),
  ...['약학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '약학대학')).toList(),
  ...['간호학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '적십자간호대학')).toList(),
  ...['공연영상창작학부(서울)', '공연영상창작학부(안성)', '미술학부', '디자인학부', '음악학부', '전통예술학부', '글로벌예술학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '예술대학')).toList(),
  ...['예술공학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '예술공학대학')).toList(),
  ...['스포츠과학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '체육대학')).toList(),
];