import 'package:awesome_select/awesome_select.dart';

final List<S2Choice<String>> defaultMajor = [
  ...['경영', '경제', '광광', '광고홍보', '금융보험', '무역', '부동산', '비서', '세무', '회계']
      .map((major) => S2Choice<String>(value: major, title: major, group: '상경')).toList(),
  ...['국제', '사회', '사회과학', '사회복지', '소비자', '심리', '아동가족', '언론정보', '정치외교', '지리', '행정']
      .map((major) => S2Choice<String>(value: major, title: major, group: '사회과학')).toList(),
  ...['대기', '물리', '생명', '수학', '지구환경', '천문', '통계', '해양', '화학', '화학생명']
      .map((major) => S2Choice<String>(value: major, title: major, group: '자연')).toList(),
  ...['기계', '도시교통', '산업금융', '전기', '컴퓨터', '토목건설', '화학생명']
      .map((major) => S2Choice<String>(value: major, title: major, group: '공학')).toList(),
  ...['교육대학', '사범대학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '교육')).toList(),
  ...['식품영양', '실내건축', '의류의상', '조리과학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '생활과학')).toList(),
  ...['교육학', '국어국문', '노어노문', '독어독문', '문예창작', '문화재학', '문헌정보', '불어불문', '사학', '서어서문', '언어학', '영어영문', '일어일문', '종교학', '중어중문', '철학', '한문학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '인문')).toList(),
  ...['간호대', '보건과학', '수의학', '약대', '의학', '치의학', '한의학']
      .map((major) => S2Choice<String>(value: major, title: major, group: '의약학')).toList(),
  ...['게임', '공예', '디자인', '만화', '미술사학', '사진', '순수미술', '애니메이션', '응용예술']
      .map((major) => S2Choice<String>(value: major, title: major, group: '미술')).toList(),
  ...['공연제작', '모델', '무용', '미용', '방송연예', '연극', '영화']
      .map((major) => S2Choice<String>(value: major, title: major, group: '예술')).toList(),
  ...['국악', '기악', '성악', '실용음악', '음악학', '음향', '작곡']
      .map((major) => S2Choice<String>(value: major, title: major, group: '음악')).toList(),
  ...['경호', '스포츠경엉', '스포츠의학', '스포츠 커뮤니케이션', '체육교육']
      .map((major) => S2Choice<String>(value: major, title: major, group: '체육')).toList(),
  ...['경찰대', '사관학교', '자유전공', '항공서비스', '항공운항', '기타']
      .map((major) => S2Choice<String>(value: major, title: major, group: '특수')).toList(),
];