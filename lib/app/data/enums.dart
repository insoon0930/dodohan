enum StorageBucket { profile, studentId, selfIntroduction }
enum IdStatus { waiting, confirmed, rejected }
enum MatchStatus { unChecked, checked, confirmed, rejected }
enum CardStatus { unChecked, checked, confirmed1st, rejected1st, confirmed2nd, rejected2nd }
enum SelfApplicationStatus { closed, openedByApplicant, openedByOwner, confirmed1st, confirmed2nd }
enum CoinReceiptType {
  chargeCoin,
  dailyReject,
  weeklyReject,
  weeklyRefund,
  consoleReward,
  dailyCard,
  dailyCardRefund,
  dailyChooseMore,
  weeklyMatch,
  dailyReward,
  imageUpdateRequest,
  imageUpdateReject,
  createSelfIntro,
  selfIntroApply,
  selfIntroConfirm1st,
  selfIntroConfirm2nd,
  selfIntroOpenApplicantCard
}

enum Region {
  seoul,
  busan,
  daegu,
  incheon,
  gwangju,
  daejeon,
  ulsan,
  sejong,
  gyeonggi,
  gangwon,
  chungbuk,
  chungnam,
  jeonbuk,
  jeonnam,
  gyeongbuk,
  gyeongnam,
  jeju
}

const Map<String, String> regionFilter = {
  'seoul': '서울·경기·인천',
  'busan': '경남권',
  'daegu': '경북권',
  'incheon': '서울·경기·인천',
  'gwangju': '전라도',
  'daejeon': '충청도',
  'ulsan': '경남권',
  'sejong': '충청도',
  'gyeonggi': '서울·경기·인천',
  'gangwon': '강원도',
  'chungbuk': '충청도',
  'chungnam': '충청도',
  'jeonbuk': '전라도',
  'jeonnam': '전라도',
  'gyeongbuk': '경북권',
  'gyeongnam': '경남권',
  'jeju': '제주도',
};

enum FcmPushType {
  checkWeekly(title: '', body: "금주의 매칭 결과가 발표되었어요!"),
  weeklyChoiceMade(title: '', body: "상대방이 최종 결정을 내렸어요!"),
  weeklyMatched(title: '', body: "최종 매칭에 성공했어요!"),
  weeklyMatchFailed(title: '', body: "최종 매칭에 실패해 하트 1개를 돌려 받았어요"),
  dailyConfirmed1st(title: '오늘의 카드', body: "누군가 나를 선택했어요!"),
  dailyConfirmed1stInReaction(title: '오늘의 카드', body: "1차 매칭에 성공했어요!"),
  dailyReject1st(title: '오늘의 카드', body: "1차 신청이 거절됐어요"),
  dailyDone2nd(title: '오늘의 카드', body: "상대방이 최종 결정을 내렸어요!"),
  dailyCardMatched(title: '오늘의 카드', body: "최종 매칭에 성공했어요!"),
  dailyCardMatchFailed(title: '오늘의 카드', body: "최종 매칭에 실패해 하트 1개를 돌려 받았어요"),
  identity(title: '관리자 알림', body: "본인인증 심사 요청이 들어왔습니다"),
  // imageUpdateRequest(title: '관리자 알림', body: "이미지 변경 요청이 들어왔습니다"),

  imageUpdateConfirm(title: '프로필 변경 승인', body: "프로필 이미지 변경이 완료되었습니다"),
  imageUpdateReject(title: '프로필 변경 실패', body: "프로필 사진 정책에 맞지 않아 반려되었습니다"),

  identityConfirm(title: '본인 인증 승인', body: "본인 인증이 완료되었습니다"),
  identityReject(title: '본인 인증 실패', body: "학생증 및 프로필 사진을 다시 확인해주세요"),

  selfIntroductionApply(title: '셀프 소개', body: "누군가 프로필을 보내왔어요!"),
  selfIntroductionConfirmed1st(title: '셀프 소개', body: "상대방이 내 신청을 수락했어요!"),
  selfIntroductionConfirmed2nd(title: '셀프 소개', body: "상대방이 최종 수락을 했어요!"),
  selfIntroductionDeletedByAdmin(title: '셀프 소개', body: "관리자에 의해 소개가 삭제되었습니다"),

  // coinPurchased3(title: '관리자 알림', body: "3코인 구매가 이루어졌습니다. +3,900₩"),
  coinPurchased6(title: '관리자 알림', body: "6코인 구매가 이루어졌습니다. +5,900₩"),
  coinPurchased12(title: '관리자 알림', body: "12코인 구매가 이루어졌습니다.+10,900₩"),
  coinPurchased24(title: '관리자 알림', body: "24코인 구매가 이루어졌습니다. +18,900₩"),
  coinPurchased40(title: '관리자 알림', body: "40코인 구매가 이루어졌습니다. +28,900₩");

  final String title;
  final String body;
  const FcmPushType({
    required this.title,
    required this.body,
  });
}