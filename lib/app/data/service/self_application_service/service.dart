import 'package:dodohan/app/data/model/daily_opened_card.dart';
import 'package:dodohan/app/data/service/daily_card_service/repository.dart';
import 'package:dodohan/app/data/service/self_application_service/repository.dart';
import '../../enums.dart';
import '../../model/daily_card.dart';
import '../../model/self_application.dart';
import '../../provider/api_service.dart';
import '../daily_opened_card_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class SelfApplicationService extends ApiService  {
  final SelfApplicationRepository _selfApplicationRepository = SelfApplicationRepository();
  // final DailyOpenedCardRepository _dailyOpenedCardRepository = DailyOpenedCardRepository();

  SelfApplicationService._privateConstructor();
  static final SelfApplicationService _instance = SelfApplicationService._privateConstructor();
  factory SelfApplicationService() {
    return _instance;
  }

  //@Get
  Future<List<SelfApplication>> findToday(String user) async {
    return await _selfApplicationRepository.findToday(user);
  }

  //@Get
  Future<List<SelfApplication>> findSent(String user) async {
    return await _selfApplicationRepository.findSent(user);
  }

  //@Get
  Future<List<SelfApplication>> findReceived(String user) async {
    return await _selfApplicationRepository.findReceived(user);
  }

  //@Patch
  Future<void> updateMeStatus(SelfApplication selfApplication, CardStatus status) async {
    final SelfApplication updatedSelfApplication = await _selfApplicationRepository.updateMeStatus(selfApplication, status);
    // if (updatedSelfApplication.meStatus == CardStatus.confirmed1st && updatedSelfApplication.youStatus == CardStatus.confirmed1st) {
    //   _dailyOpenedCardRepository.create(DailyOpenedCard(me: selfApplication.meInfo!.user!, you: selfApplication.youInfo!.user!));
    // }
    return;
  }

  //@Patch
  Future<void> block(SelfApplication selfApplication) async {
    return await _selfApplicationRepository.updateBlock(selfApplication);
  }

  //@Patch
  Future<void> updateYouStatus(SelfApplication selfApplication, CardStatus status) async {
    final SelfApplication updatedSelfApplication = await _selfApplicationRepository.updateYouStatus(selfApplication, status);
    // if (updatedSelfApplication.meStatus == CardStatus.confirmed1st && updatedSelfApplication.youStatus == CardStatus.confirmed1st) {
    //   _dailyOpenedCardRepository.create(DailyOpenedCard(me: selfApplication.meInfo!.user!, you: selfApplication.youInfo!.user!));
    // }
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
