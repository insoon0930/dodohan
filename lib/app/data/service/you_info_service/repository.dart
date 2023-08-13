import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/provider/api_service.dart';
import '../../model/me_info.dart';
import '../../model/you_info.dart';
import '../me_info_service/repository.dart';
class YouInfoRepository extends ApiService {

  YouInfoRepository._privateConstructor();
  static final YouInfoRepository _instance = YouInfoRepository._privateConstructor();
  factory YouInfoRepository() {
    return _instance;
  }
  final MeInfoRepository _meInfoRepository = MeInfoRepository();

  Future<YouInfo> create(YouInfo youInfo) async {
    try {
      final doc = firestore.collection('youInfos').doc();
      youInfo.id = doc.id;
      await doc.set(youInfo.toJson());
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

  Future<void> updateBodyShapeType() async {
    try {
      // 기존 데이터 가져오기
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection('youInfos').get();

      // 기존 문자열 필드를 리스트로 변환하여 업데이트
      for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot in snapshot.docs) {
        var oldStringField = docSnapshot.data()['bodyShape']; // 기존 문자열 필드 이름
        print('oldStringField: $oldStringField');

        final List<String> newStringListField;

        // 리스트로 변환
        if (oldStringField == null || oldStringField.runtimeType != String) {
          continue;
        }

        if(oldStringField == '상관없음') {
          MeInfo meInfo = await _meInfoRepository.findOne(docSnapshot.data()['user']);
          if(meInfo.isMan!) {
            newStringListField = ['마른', '보통', '통통', '볼륨있는'];
          } else {
            newStringListField = ['마른', '보통', '통통', '근육있는'];
          }
        } else {
          newStringListField = [oldStringField];
        }
        print('newStringListField!!: $newStringListField');
        // 해당 문서 업데이트
        await firestore.collection('youInfos').doc(docSnapshot.id).update({
          'bodyShape': newStringListField,
        });
      }
      return;
    } catch (e) {
      rethrow;
    }
  }

}