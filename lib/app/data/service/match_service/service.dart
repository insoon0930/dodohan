import 'package:stamp_now/app/data/service/match_service/repository.dart';
import '../../enums.dart';
import '../../model/match.dart';

class MatchService {
  final MatchRepository _matchRepository = MatchRepository();

  MatchService._privateConstructor();
  static final MatchService _instance = MatchService._privateConstructor();
  factory MatchService() {
    return _instance;
  }

  //@Get
  Future<Match?> findOne(String user, bool isMan) async {
    return await _matchRepository.findOne(user, isMan);
  }

  //@Get
  Future<List<Match>> findTwoWeeks() async {
    return await _matchRepository.findTwoWeeks();
  }

  //@Patch
  Future<void> updateMatchStatus(String docId, bool isMan, MatchStatus newStatus) async {
    return await _matchRepository.updateMatchStatus(docId, isMan, newStatus);
  }
}
