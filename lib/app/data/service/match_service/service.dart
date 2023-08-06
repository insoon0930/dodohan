import 'package:stamp_now/app/data/service/match_service/repository.dart';
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
}
