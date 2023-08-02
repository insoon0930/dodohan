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
      final ref = await firestore.collection('youInfos').add(youInfo.toJson());
      await ref.update({'id': ref.id});
      final snapshot = await ref.get();
      return YouInfo.fromJson(snapshot.data()!);
    } catch (e) {
      rethrow;
    }
  }

  Future<YouInfo> findOne(String user) async {
    try {
      print('user?? :$user');
      QuerySnapshot querySnapshot = await firestore
          .collection('youInfos')
          .where('user', isEqualTo: user)
          .get();
      print('user??2 :${querySnapshot.docs.first.data()}');
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