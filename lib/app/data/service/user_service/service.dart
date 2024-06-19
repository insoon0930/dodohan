import 'dart:developer';

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
  Future<User?> findDeletedOneByPhoneNum(String phoneNum) async {
    return await _userRepository.findDeletedOneByPhoneNum(phoneNum);
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

  //@Get
  Future<Map<String, int>> findUserNumIncludeDeleted() async {
    return await _userRepository.findUserNumIncludeDeleted();
  }

  //@Get
    //todo 남여 구문, 하나의 아이템에 담겨있어야 하는 정보. 1. 구간 사이의 인원
  Future<List<int>> findManCoinDistribution({bool isDeleted = false}) async {
    //이전에 isMan, coin, isDeleted 로 구분해서 다 저장하자
    //그리고 해당 아이템들을 set 으로 만들어 종류 구분
    //해당 set 의 아이템들에 대해 갯수 세어달라하며 리스트 대입
    //다 한다음에 더 간단하게 만들어 달라고해보자

    //이렇게 할랬다가 비용좀 나올거 같아서 보다 간단하게 count로 범위별 처리해서 그래프만 표현하기
    final int manRange0to5 = await _userRepository.findNumWithCoin(isMan: true, greaterThanAndEqual: 0, lessThanAndEqual: 5);
    final int manRange6to9 = await _userRepository.findNumWithCoin(isMan: true, greaterThanAndEqual: 6, lessThanAndEqual: 9);
    final int manRange10 = await _userRepository.findNumWithCoin(isMan: true, greaterThanAndEqual: 10, lessThanAndEqual: 10);
    final int manRange11to20 = await _userRepository.findNumWithCoin(isMan: true, greaterThanAndEqual: 11, lessThanAndEqual: 20);
    final int manRange21to100 = await _userRepository.findNumWithCoin(isMan: true, greaterThanAndEqual: 21, lessThanAndEqual: 100);
    return [manRange0to5, manRange6to9, manRange10, manRange11to20, manRange21to100];
  }

  //@Get
  Future<List<int>> findWomanCoinDistribution({bool isDeleted = false}) async {
    final int womanRange0to5 = await _userRepository.findNumWithCoin(isMan: false, greaterThanAndEqual: 0, lessThanAndEqual: 5);
    final int womanRange6to9 = await _userRepository.findNumWithCoin(isMan: false, greaterThanAndEqual: 6, lessThanAndEqual: 9);
    final int womanRange10 = await _userRepository.findNumWithCoin(isMan: false, greaterThanAndEqual: 10, lessThanAndEqual: 10);
    final int womanRange11to20 = await _userRepository.findNumWithCoin(isMan: false, greaterThanAndEqual: 11, lessThanAndEqual: 20);
    final int womanRange21to100 = await _userRepository.findNumWithCoin(isMan: false, greaterThanAndEqual: 21, lessThanAndEqual: 100);
    return [womanRange0to5, womanRange6to9, womanRange10, womanRange11to20, womanRange21to100];
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

  //@Patch
  Future<void> updateFcmToken(String userId, String? deviceToken) async {
    return await _userRepository.updateFcmToken(userId, deviceToken);
  }

  //@Patch
  Future<void> removeFcmToken(String userId) async {
    return await _userRepository.updateFcmToken(userId, null);
  }

  //@Patch
  Future<void> updateUidToWithdraw(String userId, String uid) async {
    return await _userRepository.updateUidToWithdraw(userId, uid);
  }
}
