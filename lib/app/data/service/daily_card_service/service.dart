import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stamp_now/app/data/service/daily_card_service/repository.dart';
import 'package:stamp_now/app/data/service/identity_service/repository.dart';
import '../../enums.dart';
import '../../model/daily_card.dart';
import '../../model/identity.dart';
import '../../model/me_info.dart';
import '../../model/you_info.dart';
import '../../provider/api_service.dart';
import '../me_info_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class DailyCardService extends ApiService  {
  final DailyCardRepository _dailyCardRepository = DailyCardRepository();
  final UserRepository _userRepository = UserRepository();
  final MeInfoRepository _meInfoRepository = MeInfoRepository();
  final YouInfoRepository _youInfoRepository = YouInfoRepository();

  DailyCardService._privateConstructor();
  static final DailyCardService _instance = DailyCardService._privateConstructor();
  factory DailyCardService() {
    return _instance;
  }

  //@Get
  Future<List<DailyCard>> findToday(String user) async {
    return await _dailyCardRepository.findToday(user);
  }

  // //@Get
  // Future<List<DailyCard>> findWaiting() async {
  //   return await _dailyCardRepository.findWaiting();
  // }
  //

  //@Patch
  Future<void> updateMeStatus(String dailyCardId, MatchStatus status) async {
    return await _dailyCardRepository.updateMeStatus(dailyCardId, status);
  }

  //@Patch
  Future<void> updateYouStatus(String dailyCardId, MatchStatus status) async {
    return await _dailyCardRepository.updateYouStatus(dailyCardId, status);
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
