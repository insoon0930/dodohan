import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/provider/api_service.dart';
import '../../enums.dart';
import '../../model/me_info.dart';
class MeInfoRepository extends ApiService {

  MeInfoRepository._privateConstructor();
  static final MeInfoRepository _instance = MeInfoRepository._privateConstructor();
  factory MeInfoRepository() {
    return _instance;
  }

  Future<MeInfo> create(MeInfo meInfo) async {
    try {
      final doc = firestore.collection('meInfos').doc();
      meInfo.id = doc.id;
      doc.set(meInfo.toJson());
      return meInfo;
    } catch (e) {
      rethrow;
    }
  }

  Future<MeInfo> findOne(String user) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('meInfos')
          .where('user', isEqualTo: user)
          .get();
      return MeInfo.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateOne(String docId, MeInfo newMeInfo) async {
    try {
      DocumentReference identityRef = firestore.collection('meInfos').doc(docId);
      await identityRef.set(newMeInfo.toJson());
      return;
    } catch (e) {
      rethrow;
    }
  }

}