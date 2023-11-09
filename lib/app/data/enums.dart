enum StorageBucket { profile, studentId }
enum IdStatus { waiting, confirmed, rejected }
enum MatchStatus { unChecked, checked, confirmed, rejected }
enum CardStatus { unChecked, checked, confirmed1st, rejected1st, confirmed2nd, rejected2nd }
enum CoinReceiptType { chargeCoin, dailyReject, weeklyReject, consoleReward, dailyCard, weeklyMatch, dailyReward }
enum Region { seoul, busan, daegu, incheon, gwangju, daejeon, ulsan, sejong, gyeonggi, gangwon, chungbuk, chungnam, jeonbuk, jeonnam, gyeongbuk, gyeongnam, jeju }

enum FcmPushType {
  checkWeekly(body: "교내 소개팅 - 매칭 결과가 발표되었습니다!"),
  weeklyDone(body: "교내 소개팅 - 상대방이 최종 결정을 내렸어요!"),
  dailyDone1st(body: "오늘의 카드 - 누군가 나를 선택했어요!"),
  dailyDone2nd(body: "오늘의 카드 - 상대방이 최종 결정을 내렸어요!"),
  identity(body: "본인인증 심사 요청이 들어왔습니다"),
  imageUpdateRequest(body: "이미지 변경 요청이 들어왔습니다");

  final String body;
  const FcmPushType({
    required this.body,
  });
}