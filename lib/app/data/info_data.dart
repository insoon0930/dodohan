import 'package:awesome_select/awesome_select.dart';

class InfoData {
  static List<S2Choice<String>> major = [
    S2Choice<String>(value: '반도체공학과', title: '반도체공학과', group: '공과대학'),
    S2Choice<String>(value: '건축학부', title: '건축학부', group: '공과대학'),
    S2Choice<String>(value: '건축공학부', title: '건축공학부', group: '공과대학'),
    S2Choice<String>(value: '건설환경공학부', title: '건설환경공학부', group: '공과대학'),
    S2Choice<String>(value: '도시공학과', title: '도시공학과', group: '공과대학'),
    S2Choice<String>(value: '자원환경공학과', title: '자원환경공학과', group: '공과대학'),
    S2Choice<String>(value: '융합전자공학부', title: '융합전자공학부', group: '공과대학'),
    S2Choice<String>(value: '전기생체공학부', title: '전기생체공학부', group: '공과대학'),
    S2Choice<String>(value: '신소재공학부', title: '신소재공학부', group: '공과대학'),
    S2Choice<String>(value: '화학공학과', title: '화학공학과', group: '공과대학'),
    S2Choice<String>(value: '생명공학과', title: '생명공학과', group: '공과대학'),
    S2Choice<String>(value: '유기나노공학과', title: '유기나노공학과', group: '공과대학'),
    S2Choice<String>(value: '에너지공학과', title: '에너지공학과', group: '공과대학'),
    S2Choice<String>(value: '기계공학부', title: '기계공학부', group: '공과대학'),
    S2Choice<String>(value: '원자력공학과', title: '원자력공학과', group: '공과대학'),
    S2Choice<String>(value: '산업공학과', title: '산업공학과', group: '공과대학'),
    S2Choice<String>(value: '데이터사이언스학부', title: '데이터사이언스학부', group: '소프트웨어대학'),
    S2Choice<String>(value: '컴퓨터소프트웨어학부', title: '컴퓨터소프트웨어학부', group: '소프트웨어대학'),
    S2Choice<String>(value: '정보시스템학과', title: '정보시스템학과', group: '소프트웨어대학'),
    S2Choice<String>(value: '미래자동차공학과', title: '미래자동차공학과', group: '소프트웨어대학'),
    S2Choice<String>(value: '의예과', title: '의예과', group: '의과대학'),
    S2Choice<String>(value: '의학과', title: '의학과', group: '의과대학'),
    S2Choice<String>(value: '국어국문학과', title: '국어국문학과', group: '인문과학대학'),
    S2Choice<String>(value: '중어중문학과', title: '중어중문학과', group: '인문과학대학'),
    S2Choice<String>(value: '영어영문학과', title: '영어영문학과', group: '인문과학대학'),
    S2Choice<String>(value: '독어독문학과', title: '독어독문학과', group: '인문과학대학'),
    S2Choice<String>(value: '사학과', title: '사학과', group: '인문과학대학'),
    S2Choice<String>(value: '철학과', title: '철학과', group: '인문과학대학'),
    S2Choice<String>(value: '미래인문학융합학부', title: '미래인문학융합학부', group: '인문과학대학'),
    S2Choice<String>(value: '대중문화·시나리오 학과', title: '대중문화·시나리오 학과', group: '인문과학대학'),
    S2Choice<String>(value: '정치외교학과', title: '정치외교학과', group: '사회과학대학'),
    S2Choice<String>(value: '사회학과', title: '사회학과', group: '사회과학대학'),
    S2Choice<String>(value: '미디어커뮤니케이션학과', title: '미디어커뮤니케이션학과', group: '사회과학대학'),
    S2Choice<String>(value: '관광학부', title: '관광학부', group: '사회과학대학'),
    S2Choice<String>(value: '수학과', title: '수학과', group: '자연과학대학'),
    S2Choice<String>(value: '물리학과', title: '물리학과', group: '자연과학대학'),
    S2Choice<String>(value: '화학과', title: '화학과', group: '자연과학대학'),
    S2Choice<String>(value: '생명과학과', title: '생명과학과', group: '자연과학대학'),
    S2Choice<String>(value: '정책학과', title: '정책학과', group: '정책과학대학'),
    S2Choice<String>(value: '행정학과', title: '행정학과', group: '정책과학대학'),
    S2Choice<String>(value: '과학기술정책학과', title: '과학기술정책학과', group: '정책과학대학'),
    S2Choice<String>(value: '경제금융대학', title: '경제금융대학', group: '경제금융대학'),
    S2Choice<String>(value: '경영학부', title: '경영학부', group: '경영대학'),
    S2Choice<String>(value: '파이낸스경영학과', title: '파이낸스경영학과', group: '경영대학'),
    S2Choice<String>(value: '교육학과', title: '교육학과', group: '사범대학'),
    S2Choice<String>(value: '교육공학과', title: '교육공학과', group: '사범대학'),
    S2Choice<String>(value: '국어교육과', title: '국어교육과', group: '사범대학'),
    S2Choice<String>(value: '영어교육과', title: '영어교육과', group: '사범대학'),
    S2Choice<String>(value: '수학교육과', title: '수학교육과', group: '사범대학'),
    S2Choice<String>(value: '응용미술교육과', title: '응용미술교육과', group: '사범대학'),
    S2Choice<String>(value: '의류학과', title: '의류학과', group: '생활과학대학'),
    S2Choice<String>(value: '식품영양학과', title: '식품영양학과', group: '생활과학대학'),
    S2Choice<String>(value: '실내건축디자인학과', title: '실내건축디자인학과', group: '생활과학대학'),
    S2Choice<String>(value: '기능성식품학과', title: '기능성식품학과', group: '생활과학대학'),
    S2Choice<String>(value: '성악과', title: '성악과', group: '음악대학'),
    S2Choice<String>(value: '작곡과', title: '작곡과', group: '음악대학'),
    S2Choice<String>(value: '피아노과', title: '피아노과', group: '음악대학'),
    S2Choice<String>(value: '관현악과', title: '관현악과', group: '음악대학'),
    S2Choice<String>(value: '국악과', title: '국악과', group: '음악대학'),
    S2Choice<String>(value: '스포츠산업과학부', title: '스포츠산업과학부', group: '예술/체육대학'),
    S2Choice<String>(value: '연극영화학과', title: '연극영화학과', group: '예술/체육대학'),
    S2Choice<String>(value: '무용학과', title: '무용학과', group: '예술/체육대학'),
    S2Choice<String>(value: '국제학부', title: '국제학부', group: '국제학부'),
    S2Choice<String>(value: '간호대학', title: '간호대학', group: '간호대학'),
    S2Choice<String>(value: '산업융합학부', title: '산업융합학부', group: '산업융합학부'),
    S2Choice<String>(value: '기타', title: '기타', group: '기타'),
    S2Choice<String>(value: '한양여대', title: '한양여대', group: '한양여대'),

  ];

  static List<S2Choice<String>> height = List.generate(
      50, (index) => S2Choice<String>(value: '${140 + index}', title: '${140 + index}'));

  static List<S2Choice<String>> age = List.generate(
      10, (index) => S2Choice<String>(value: '${20 + index}', title: '${20 + index}'));

  static List<S2Choice<String>> manBodyShape = [
    S2Choice<String>(value: '마른', title: '마른'),
    S2Choice<String>(value: '보통', title: '보통'),
    S2Choice<String>(value: '통통', title: '통통'),
    S2Choice<String>(value: '근육있는', title: '근육있는'),
  ];

  static List<S2Choice<String>> womanBodyShape = [
    S2Choice<String>(value: '마른', title: '마른'),
    S2Choice<String>(value: '보통', title: '보통'),
    S2Choice<String>(value: '통통', title: '통통'),
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

  static List<S2Choice<String>> exceptSameMajor = [
    S2Choice<String>(value: 'true', title: '배제함'),
    S2Choice<String>(value: 'false', title: '상관없음'),
  ];

}
