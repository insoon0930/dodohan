
import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorSNU = [
  ...['국어국문학과', '중어중문학과', '영어영문학과', '불어불문학과', '독어독문학과', '노어노문학과', '서어서문학과', '아시아언어문명학부', '언어학과', '역사학부', '철학과', '종교학과', '미학과', '고고미술사학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '인문대학')).toList(),
  ...['정치외교학부(정치학전공)', '정치외교학부(외교학전공)', '경제학부', '사회학과', '인류학과', '심리학과', '지리학과', '사회복지학과', '언론정보학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사회과학대학')).toList(),
  ...['수리과학부', '통계학과', '물리천문학부(물리학전공)', '물리천문학부(천문학전공)', '화학부', '생명과학부', '지구환경과학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '자연과학대학')).toList(),
  ...['간호학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '간호대학')).toList(),
  ...['경영학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '경영대학')).toList(),
  ...['건설환경공학부', '기계공학부', '항공우주공학과', '재료공학부', '전기·정보공학부', '컴퓨터공학부', '화학생물공학부', '건축학과', '산업공학과', '에너지자원공학과', '원자핵공학과', '조선해양공학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '공과대학')).toList(),
  ...['식물생산과학부', '산림과학부', '응용생물화학부', '식품·동물생명공학부', '바이오시스템·소재학부', '조경·지역시스템공학부', '농경제사회학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '농업생명과학대학')).toList(),
  ...['동양화과', '서양화과', '조소과', '디자인학부(공예)', '디자인학부(디자인)']
      .map((major) => S2Choice<String>(value: major, title: major, group: '미술대학')).toList(),
  ...['교육학과', '국어교육과', '영어교육과', '불어교육과', '사회교육과', '역사교육과', '지리교육과', '윤리교육과', '수학교육과', '물리교육과', '화학교육과', '생물교육과', '지구과학교육과', '체육교육과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사범대학')).toList(),
  ...['소비자아동학부(소비자학전공)', '소비자아동학부(아동가족학전공)', '식품영양학과', '의류학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '생활과학대학')).toList(),
  ...['수의예과', '수의학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '수의과대학')).toList(),
  //고전문헌학 러시아학 라틴아메리카학 인문데이터과학 정치-경제-철학 유럽지역학 뇌-마음-행동 금융경제 일본학 금융수학 과학기술학 학습과학
  ...['약학과', '제약학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '약학대학')).toList(),
  ...['성악과', '작곡과', '음악학과', '피아노과', '관현악과', '국악과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '음악대학')).toList(),
  ...['의예과', '의학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '의과대학')).toList(),
  ...['자유전공학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '자유전공학부')).toList(),
  ...['계산과학', '글로벌환경경영학', '기술경영', '영상매체예술', '정보문화학', '벤처경영학', '동아시아비교인문학', '인공지능', '인공지능반도체공학', '지능형통신']
      .map((major) => S2Choice<String>(value: major, title: major, group: '연합전공')).toList(),
  ...['고전문헌학', '러시아학', '라틴아메리카학', '인문데이터과학', '정치-경제-철학', '유럽지역학', '뇌-마음-행동', '금융경제', '일본학', '금융수학', '과학기술학', '학습과학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '연계전공')).toList(),
  S2Choice<String>(value: '기타', title: '기타', group: '기타'),
];