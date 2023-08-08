import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/provider/api_service.dart';
import '../../model/you_info.dart';
class YouInfoRepository extends ApiService {

  YouInfoRepository._privateConstructor();
  static final YouInfoRepository _instance = YouInfoRepository._privateConstructor();
  factory YouInfoRepository() {
    return _instance;
  }

  Future<YouInfo> create(YouInfo youInfo) async {
    try {
      final doc = firestore.collection('youInfos').doc();
      youInfo.id = doc.id;
      doc.set(youInfo.toJson());
      return youInfo;
    } catch (e) {
      rethrow;
    }
  }

  Future<YouInfo> findOne(String user) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('youInfos')
          .where('user', isEqualTo: user)
          .get();
      return YouInfo.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateOne(String docId, YouInfo newYouInfo) async {
    try {
      DocumentReference identityRef = firestore.collection('youInfos').doc(docId);
      await identityRef.set(newYouInfo.toJson());
      return;
    } catch (e) {
      rethrow;
    }
  }

}