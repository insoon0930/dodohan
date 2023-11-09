import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/provider/api_service.dart';
import '../../enums.dart';
import '../../model/identity.dart';
import '../../model/user.dart';
class UserRepository extends ApiService {

  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();
  factory UserRepository() {
    return _instance;
  }

  Future<User> create(User user) async {
    try {
      final doc = firestore.collection('users').doc();
      user.id = doc.id;
      await doc.set(user.toJson());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> findOne(String id) async {
    try {
      DocumentSnapshot userSnapshot = await firestore.collection('users').doc(id).get();
      return User.fromJson(userSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<User?> findOneByUid(String uid) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('uid', isEqualTo: uid)
          .where('deletedAt', isNull: true)
          .get();
      return User.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<User?> findOneByPhoneNum(String phoneNum) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('phoneNum', isEqualTo: phoneNum)
          .where('deletedAt', isNull: false)
          .orderBy('deletedAt', descending: true)
          .get();
      print('querySnapshot.docs: ${querySnapshot.docs}');
      if (querySnapshot.docs.isEmpty) {
        return null;
      }
      return User.fromJson(querySnapshot.docs.last.data() as Map<String, dynamic>);
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  Future<List<User>> findWomen() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('isMan', isEqualTo: false)
          .get();

      List<User> users = querySnapshot.docs
          .map((e) => User.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      // createdAt 필드 기준으로 오름차순 정렬
      users.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      return users;
    } catch (e) {
      print('findWomen error: $e');
      return [];
    }
  }

  Future<Map<String, int>> findUserNum(bool isDeleted) async {
    try {
      // 남자 수 가져오기
      QuerySnapshot querySnapshotMan = await firestore
          .collection('users')
          .where('isMan', isEqualTo: true)
          .where('deletedAt', isNull: !isDeleted)
          .get();

      final manNum = querySnapshotMan.size;

      // 여자 수 가져오기
      QuerySnapshot querySnapshotWoman = await firestore
          .collection('users')
          .where('isMan', isEqualTo: false)
          .where('deletedAt', isNull: !isDeleted)
          .get();

      final womanNum = querySnapshotWoman.size;
      return {'manNum': manNum + 95, 'womanNum': womanNum + 65};
    } catch (e) {
      print('findUserNum error: $e');
      return {'manNum': 0, 'womanNum': 0};
    }
  }

  Future<void> updateIdStatus(String userId, IdStatus idStatus, WriteBatch? batch) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      if (batch == null) {
        await ref.update({'idStatus': idStatus.name});
      } else {
        batch.update(ref, {'idStatus': idStatus.name});
      }
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfileImage(String userId, String url) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      await ref.update({'profileImage': url});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateIsMan(String userId, bool isMan) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      await ref.update({'isMan': isMan});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDefaultCoin() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('users').get();
      for (final doc in snapshot.docs) {
        await doc.reference.update({'coin': 10});
      }
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> increaseCoin(String userId, int coin) async {
    try {
      final DocumentReference userDocRef = firestore.collection('users').doc(userId);
      final DocumentSnapshot userDocSnapshot = await userDocRef.get();
      final currentCoin = (userDocSnapshot.data() as Map<String, dynamic>)['coin'];
      await userDocRef.update({'coin': currentCoin + coin});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> idConfirmed(Identity identity) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(identity.user);
      await ref.update({
        'idStatus': IdStatus.confirmed.name,
        'profileImage': identity.profileImage,
        'isMan': identity.isMan,
        'univ': identity.univ,
      });
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> idRejected(Identity identity) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(identity.user);
      ref.update({'idStatus': IdStatus.rejected.name});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDeletedAt(String userId) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      ref.update({'deletedAt': DateTime.now()});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateReviewRequestedAt(String userId) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      ref.update({'reviewRequestedAt': DateTime.now()});
      return;
    } catch (e) {
      rethrow;
    }
  }

  void updateLastVisitedAt(String userId) {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      ref.update({'lastVisitedAt': DateTime.now()});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateFcmToken(String userId, String? fcmToken) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      ref.update({'fcmToken': fcmToken});
      return;
    } catch (e) {
      rethrow;
    }
  }
}
