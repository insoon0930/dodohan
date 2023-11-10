import 'package:dodohan/app/data/model/daily_opened_card.dart';
import 'package:dodohan/app/data/service/daily_card_service/repository.dart';
import '../../enums.dart';
import '../../model/daily_card.dart';
import '../../provider/api_service.dart';
import '../daily_opened_card_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class DailyCardService extends ApiService  {
  final DailyCardRepository _dailyCardRepository = DailyCardRepository();
  final DailyOpenedCardRepository _dailyOpenedCardRepository = DailyOpenedCardRepository();

  DailyCardService._privateConstructor();
  static final DailyCardService _instance = DailyCardService._privateConstructor();
  factory DailyCardService() {
    return _instance;
  }

  //@Get
  Future<List<DailyCard>> findToday(String user) async {
    return await _dailyCardRepository.findToday(user);
  }

  //@Get
  Future<List<DailyCard>> findSent(String user) async {
    return await _dailyCardRepository.findSent(user);
  }

  //@Get
  Future<List<DailyCard>> findReceived(String user) async {
    return await _dailyCardRepository.findReceived(user);
  }

  //@Patch
  Future<void> updateMeStatus(DailyCard dailyCard, CardStatus status) async {
    final DailyCard updatedDailyCard = await _dailyCardRepository.updateMeStatus(dailyCard, status);
    if (updatedDailyCard.meStatus == CardStatus.confirmed1st && updatedDailyCard.youStatus == CardStatus.confirmed1st) {
      _dailyOpenedCardRepository.create(DailyOpenedCard(me: dailyCard.meInfo!.user!, you: dailyCard.youInfo!.user!));
    }
    return;
  }

  //@Patch
  Future<void> block(DailyCard dailyCard) async {
    return await _dailyCardRepository.updateBlock(dailyCard);
  }

  //@Patch
  Future<void> updateYouStatus(DailyCard dailyCard, CardStatus status) async {
    final DailyCard updatedDailyCard = await _dailyCardRepository.updateYouStatus(dailyCard, status);
    if (updatedDailyCard.meStatus == CardStatus.confirmed1st && updatedDailyCard.youStatus == CardStatus.confirmed1st) {
      _dailyOpenedCardRepository.create(DailyOpenedCard(me: dailyCard.meInfo!.user!, you: dailyCard.youInfo!.user!));
    }
    return;
  }

  // //@Patch
  // Future<void> confirmed(DailyCard dailyCard) async {
  //   await _dailyCardRepository.updateStatus(dailyCard.id, IdStatus.confirmed);
  //   await _userRepository.idConfirmed(dailyCard);
  //   await _meInfoRepository.create(MeInfo(user: dailyCard.user, isMan: dailyCard.isMan));
  //   await _youInfoRepository.create(YouInfo(user: dailyCard.user));
  //   return;
  // }
  //
  // //@Patch
  // Future<void> rejected(DailyCard dailyCard) async {
  //   await _dailyCardRepository.updateStatus(dailyCard.id, IdStatus.rejected);
  //   await _userRepository.idRejected(dailyCard);
  //   return;
  // }
}
