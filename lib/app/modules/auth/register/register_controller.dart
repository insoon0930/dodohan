import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/model/identity.dart';
import 'package:stamp_now/core/services/auth_service.dart';

import '../../../../routes/app_routes.dart';
import '../../../data/eums.dart';
import '../../../data/model/user.dart';
import '../../../data/provider/storage_service.dart';
import '../../../data/service/identity_service/service.dart';
import '../../../data/service/user_service/service.dart';

class RegisterController extends GetxController {
  final StorageService storageService = Get.find();
  final IdentityService identityService = IdentityService();
  final UserService userService = UserService();

  final Rxn<bool> isMan = Rxn<bool>();
  final Rxn<XFile> profileImage = Rxn<XFile>();
  final Rxn<XFile> studentIdImage = Rxn<XFile>();

  bool get ready => isMan.value != null && profileImage.value != null && studentIdImage.value != null;
  User get user => AuthService.to.user.value;

  Future<void> register() async {
    //이미지 두개 저장 //이미지 서비스 하나 두고 진행 ㅇㅇ.?
    String profileUrl = await storageService.uploadFile(
        file: profileImage.value!,
        bucket: StorageBucket.profile,
        userId: user.id);
    String studentIdUrl = await storageService.uploadFile(
        file: studentIdImage.value!,
        bucket: StorageBucket.studentId,
        userId: user.id);

    print('profileUrl: $profileUrl, studentIdUrl: $studentIdUrl');
    //들고온 이미지로 다큐먼트 생성
    await identityService.create(Identity(
        user: user.id,
        profileImage: profileUrl,
        studentIdImage: studentIdUrl,
        isMan: isMan.value!));


    //유저 모델 상태 업데이트
    await userService.updateIdStatus(user.id, IdStatus.waiting);
    user.idStatus = IdStatus.waiting;

    // 페이지 라우팅 //본인 인증이 진행중입니다(24시간 이내 처리)
    Get.toNamed(Routes.waiting);
  }
}
