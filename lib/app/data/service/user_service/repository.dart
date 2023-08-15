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
      // todo 이거로 츄라이 해보던가 , 일단 user final
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

  Future<List<User>> findWomen() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('isMan', isEqualTo: false)
          .get();
      return querySnapshot.docs.map((e) => User.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print('findWomen error: $e');
      return [];
    }
  }

  Future<Map<String, int>> findUserNum(bool isDeleted) async {
    try {
      print('isDeleted: $isDeleted');
      QuerySnapshot querySnapshot;
      if (isDeleted) {
        print('aaa: $isDeleted');
        querySnapshot = await firestore
            .collection('users')
            .where('deletedAt', isNull: false)
            .get();
        print('!!!: ${querySnapshot.docs.first.data()}');
      } else {
        print('bbb: $isDeleted');
        querySnapshot = await firestore
            .collection('users')
            .where('deletedAt', isNull: true)
            .get();
      }

      int manNum = 0;
      int womanNum = 0;
      for (var e in querySnapshot.docs) {
        bool? isMan = (e.data() as Map<String, dynamic>)['isMan'];
        if(isMan == null) {
          continue;
        }
        if (isMan) {
          manNum++;
        } else {
          womanNum++;
        }
      }
      return {'manNum': manNum, 'womanNum': womanNum};
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

  Future<void> idConfirmed(Identity identity) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(identity.user);
      await ref.update({
        'idStatus': IdStatus.confirmed.name,
        'profileImage': identity.profileImage,
        'isMan': identity.isMan,
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
}
