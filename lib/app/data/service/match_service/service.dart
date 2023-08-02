import 'package:stamp_now/app/data/service/match_service/repository.dart';
import '../../enums.dart';
import '../../model/match.dart';
import '../../model/me_info.dart';
import '../../model/you_info.dart';
import '../me_info_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class MatchService {
  final MatchRepository _matchRepository = MatchRepository();

  MatchService._privateConstructor();
  static final MatchService _instance = MatchService._privateConstructor();
  factory MatchService() {
    return _instance;
  }

  //@Get
  Future<Match?> findOne(String user) async {
    return await _matchRepository.findOne(user);
  }

  //
  // //@Patch
  // Future<void> updateStatus(String id, IdStatus idStatus) async {
  //   return await _matchRepository.updateStatus(id, idStatus);
  // }
  //
  // //@Patch
  // Future<void> confirmed(Match match) async {
  //   await _matchRepository.updateStatus(match.id, IdStatus.confirmed);
  //   await _userRepository.confirmed(match);
  //   await _meInfoRepository.create(MeInfo(user: match.user, isMan: match.isMan));
  //   await _youInfoRepository.create(YouInfo(user: match.user));
  //   return;
  // }
  //
  // //@Patch
  // Future<void> rejected(Match match) async {
  //   await _matchRepository.updateStatus(match.id, IdStatus.rejected);
  //   await _userRepository.rejected(match);
  //   return;
  // }
}
