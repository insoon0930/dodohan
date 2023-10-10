import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/appbars/default_appbar.dart';
import '../../../widgets/expandableBox.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('자주하는 질문'),
      body: const Column(
        children: [
          ExpandableBox(title: '두근두근캠퍼스란?', body: 'CC(캠퍼스 커플) 매칭 서비스에요! 인증된 대학생만을 대상으로, 서로의 이상형 정보에 맞는 1:1 소개팅을 매주 매칭시켜줘요.'),
          ExpandableBox(title: '신청과정이 어떻게 되나요?', body: "1. '나' & '이상형' 등록\n2. 신청 버튼 클릭\n3. 매주 금요일 결과 확인"),
          ExpandableBox(title: '결과확인과정이 어떻게 되나요?', body: "매칭은 1차 2차가 있어요.\n1차 매칭에 성공시 상대방의 사진이 공개됩니다!\n이후 양측 다 수락시에만 서로에게 전화번호가 공개돼요."),
          ExpandableBox(title: '매칭 기준은 어떻게 되나요?', body: "입력한 이상형 정보가 서로의 정보와 일치하는 경우에 매치됩니다."),
          ExpandableBox(title: '매칭이 안될 수 있나요?', body: "네..🥲\n서로의 이상형에 맞는 짝이 있었더라도 1:1 매칭이다 보니 상대가 다른 분과 이미 매칭되었을 수 있습니다. (매칭 순서는 랜덤)"),
          ExpandableBox(title: '한번 매칭된 사람과 다시 매칭될 수 있나요??', body: "아니요!\n기존에 1차 매칭된 기록이 있는 상대방은 이후 매칭 대상에서 제외됩니다."),
        ],
      ).paddingAll(16),
    );
  }
}
