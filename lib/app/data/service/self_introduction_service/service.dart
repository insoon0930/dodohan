import 'package:dodohan/app/data/model/daily_opened_card.dart';
import 'package:dodohan/app/data/service/daily_card_service/repository.dart';
import 'package:dodohan/app/data/service/self_introduction_service/repository.dart';
import '../../enums.dart';
import '../../model/daily_card.dart';
import '../../model/self_introduction.dart';
import '../../provider/api_service.dart';
import '../daily_opened_card_service/repository.dart';
import '../self_application_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class SelfIntroductionService extends ApiService  {
  final SelfIntroductionRepository _selfIntroductionRepository = SelfIntroductionRepository();
  final SelfApplicationRepository _selfApplicationRepository = SelfApplicationRepository();

  SelfIntroductionService._privateConstructor();
  static final SelfIntroductionService _instance = SelfIntroductionService._privateConstructor();
  factory SelfIntroductionService() {
    return _instance;
  }

  //@Post
  Future<SelfIntroduction> create(SelfIntroduction selfIntroduction) async {
    return await _selfIntroductionRepository.create(selfIntroduction);
  }








  //@Get
  Future<List<SelfIntroduction>> findToday(String user) async {
    return await _selfIntroductionRepository.findToday(user);
  }

  //@Get
  Future<List<SelfIntroduction>> findSent(String user) async {
    return await _selfIntroductionRepository.findSent(user);
  }

  //@Get
  Future<List<SelfIntroduction>> findReceived(String user) async {
    return await _selfIntroductionRepository.findReceived(user);
  }

  //@Patch
  Future<void> updateMeStatus(SelfIntroduction selfIntroduction, CardStatus status) async {
    final SelfIntroduction updatedSelfIntroduction = await _selfIntroductionRepository.updateMeStatus(selfIntroduction, status);
    // if (updatedSelfIntroduction.meStatus == CardStatus.confirmed1st && updatedSelfIntroduction.youStatus == CardStatus.confirmed1st) {
    //   _dailyOpenedCardRepository.create(DailyOpenedCard(me: selfIntroduction.meInfo!.user!, you: selfIntroduction.youInfo!.user!));
    // }
    return;
  }

  //@Patch
  Future<void> block(SelfIntroduction selfIntroduction) async {
    return await _selfIntroductionRepository.updateBlock(selfIntroduction);
  }

  //@Patch
  Future<void> updateYouStatus(SelfIntroduction selfIntroduction, CardStatus status) async {
    final SelfIntroduction updatedselfIntroduction = await _selfIntroductionRepository.updateYouStatus(selfIntroduction, status);
    // if (updatedSelfIntroduction.meStatus == CardStatus.confirmed1st && updatedSelfIntroduction.youStatus == CardStatus.confirmed1st) {
    //   _dailyOpenedCardRepository.create(DailyOpenedCard(me: selfIntroduction.meInfo!.user!, you: selfIntroduction.youInfo!.user!));
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
