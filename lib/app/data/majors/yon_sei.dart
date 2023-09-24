
import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> majorYonSei = [
  ...['국어국문학', '중어중문학', '영어영문학', '독어독문학', '불어불문학', '노어노문학', '사학', '철학', '문헌정보학', '심리학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '문과대학')).toList(),
  ...['경제학부', '응용통계학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '상경대학')).toList(),
  S2Choice<String>(value: '경영학과', title: '경영학과', group: '경영대학'),
  ...['수학', '물리학', '화학', '지구시스템과학', '천문우주학', '대기과학', '인공위성시스템학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '이과대학')).toList(),
  ...['화공생명공학과', '전기전자공학과', '건축공학과', '도시공학과', '건설환경공학과', '기계공학과', '신소재공학과', '산업공학과', '시스템반도체공학과', '디스플레이융합공학과', '설치준비위원회']
      .map((major) => S2Choice<String>(value: major, title: major, group: '공과대학')).toList(),
  ...['시스템생물학', '생화학', '생명공학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '생명시스템대학')).toList(),
  ...['컴퓨터과학과', '인공지능학과', 'IT융합공학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '인공지능융합대학')).toList(),
  S2Choice<String>(value: '신학', title: '신학', group: '신과대학'),
  ...['정치외교학', '행정학', '사회복지학', '사회학', '문화인류학', '언론홍보영상학부']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사회과학대학')).toList(),
  ...['교회음악과', '성악과', '피아노과', '관현악과', '작곡과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '음악대학')).toList(),
  ...['의류환경학', '식품영양학', '실내건축학', '아동.가족학', '생활디자인학과']
      .map((major) => S2Choice<String>(value: major, title: major, group: '생활과학대학')).toList(),
  ...['교육학', '체육교육학', '스포츠응용산업학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '교육과학대학')).toList(),
  S2Choice<String>(value: '학부대학학부대학', title: '학부대학학부대학', group: '학부대학학부대학'),
  S2Choice<String>(value: '언더우드국제대학', title: '언더우드국제대학', group: '언더우드국제대학'),
  S2Choice<String>(value: '글로벌인재대학', title: '글로벌인재대학', group: '글로벌인재대학'),
  S2Choice<String>(value: '의과대학', title: '의과대학', group: '의과대학'),
  S2Choice<String>(value: '치과대학', title: '치과대학', group: '치과대학'),
  S2Choice<String>(value: '간호대학', title: '간호대학', group: '간호대학'),
  S2Choice<String>(value: '약학대학', title: '약학대학', group: '약학대학'),
  S2Choice<String>(value: '기타', title: '기타', group: '기타'),
];