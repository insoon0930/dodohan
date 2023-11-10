enum StorageBucket { profile, studentId }
enum IdStatus { waiting, confirmed, rejected }
enum MatchStatus { unChecked, checked, confirmed, rejected }
enum CardStatus { unChecked, checked, confirmed1st, rejected1st, confirmed2nd, rejected2nd }
enum CoinReceiptType { chargeCoin, dailyReject, weeklyReject, consoleReward, dailyCard, weeklyMatch, dailyReward }
enum Region { seoul, busan, daegu, incheon, gwangju, daejeon, ulsan, sejong, gyeonggi, gangwon, chungbuk, chungnam, jeonbuk, jeonnam, gyeongbuk, gyeongnam, jeju }

enum FcmPushType {
  checkWeekly(title: '', body: "금주의 매칭 결과가 발표되었습니다!"),
  weeklyDone(title: '', body: "상대방이 최종 결정을 내렸어요!"),
  dailyDone1st(title: '오늘의 카드', body: "누군가 나를 선택했어요!"),
  dailyDone2nd(title: '오늘의 카드', body: "상대방이 최종 결정을 내렸어요!"),
  identity(title: '관리자 알림', body: "본인인증 심사 요청이 들어왔습니다"),
  imageUpdateRequest(title: '관리자 알림', body: "이미지 변경 요청이 들어왔습니다"),

  coinPurchased3(title: '관리자 알림', body: "3코인 구매가 이루어졌습니다. +3,900₩"),
  coinPurchased6(title: '관리자 알림', body: "6코인 구매가 이루어졌습니다. +5,900₩"),
  coinPurchased12(title: '관리자 알림', body: "12코인 구매가 이루어졌습니다.+10,900₩"),
  coinPurchased24(title: '관리자 알림', body: "24코인 구매가 이루어졌습니다. +18,900₩");

  final String title;
  final String body;
  const FcmPushType({
    required this.title,
    required this.body,
  });
}