import 'package:dodohan/app/data/model/coin_receipt.dart';
import 'package:dodohan/app/data/service/user_service/repository.dart';
import '../../enums.dart';
import '../../model/user.dart';
import '../application_service/repository.dart';
import '../coin_receipt_service/repository.dart';

class UserService {
  final UserRepository _userRepository = UserRepository();
  final ApplicationRepository _applicationRepository = ApplicationRepository();
  final CoinReceiptRepository _coinReceiptRepository = CoinReceiptRepository();

  UserService._privateConstructor();
  static final UserService _instance = UserService._privateConstructor();
  factory UserService() {
    return _instance;
  }

  //@Post
  Future<User> create(User user) async {
    return await _userRepository.create(user);
  }

  //@Get
  Future<User?> findOne(String id) async {
    User? user = await _userRepository.findOne(id);
    return user;
  }

  //@Get
  Future<User?> findOneByUid(String uid) async {
    return await _userRepository.findOneByUid(uid);
  }

  //@Get
  Future<User?> findOneByPhoneNum(String phoneNum) async {
    return await _userRepository.findOneByPhoneNum(phoneNum);
  }

  //@Get
  Future<List<User>> findWomen() async {
    return await _userRepository.findWomen();
  }

  //@Get
  Future<Map<String, int>> findUserNum({bool isDeleted = false}) async {
    return await _userRepository.findUserNum(isDeleted);
  }

  //@Patch
  Future<void> updateDeletedAt(String userId) async {
    await _applicationRepository.deleteMany(userId);
    return await _userRepository.updateDeletedAt(userId);
  }

  //@Patch
  Future<void> updateReviewRequestedAt(String userId) async {
    return await _userRepository.updateReviewRequestedAt(userId);
  }

  //@Patch
  void updateLastVisitedAt(String userId) {
    return _userRepository.updateLastVisitedAt(userId);
  }

  //@Patch
  Future<void> updateDefaultCoin() async {
    return await _userRepository.updateDefaultCoin();
  }

  //@Patch
  Future<void> increaseCoin(String userId, int coin, {required CoinReceiptType type}) async {
    await _coinReceiptRepository.create(CoinReceipt(user: userId, amount: coin, type: type));
    return await _userRepository.increaseCoin(userId, coin);
  }
}
