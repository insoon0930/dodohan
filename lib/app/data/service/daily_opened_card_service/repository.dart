import '../../../data/provider/api_service.dart';
import '../../model/daily_opened_card.dart';

class DailyOpenedCardRepository extends ApiService {
  DailyOpenedCardRepository._privateConstructor();

  static final DailyOpenedCardRepository _instance = DailyOpenedCardRepository._privateConstructor();

  factory DailyOpenedCardRepository() {
    return _instance;
  }

  Future<DailyOpenedCard> create(DailyOpenedCard dailyOpenedCard) async {
    try {
      final doc = firestore.collection('dailyOpenedCards').doc();
      dailyOpenedCard.id = doc.id;
      await doc.set(dailyOpenedCard.toJson());
      return dailyOpenedCard;
    } catch (e) {
      rethrow;
    }
  }
}
