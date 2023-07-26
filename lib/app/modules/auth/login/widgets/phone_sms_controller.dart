import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/model/user.dart';

import '../../../../../core/services/auth_service.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/service/user_service/service.dart';
import 'package:stamp_now/app/data/model/user.dart' as UserModel;


class PhoneSMSController extends GetxController {
  final Rxn<String> phone = Rxn<String>();
  final RxBool isCodeSent = false.obs;
  final Rxn<String> code = Rxn<String>();

  bool get isValidPhone => phone.value?.replaceAll('-', '').length == 11;
  bool get isValidCode => code.value?.length == 4;

  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController codeTextController = TextEditingController();

  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode codeFocusNode = FocusNode();

  ConfirmationResult? confirmationResult;

  void clearPhone() {
    phoneTextController.clear();
    phone.value = null;
  }

  void clearCode() {
    codeTextController.clear();
    code.value = null;
  }

  Future<void> onTapSMSButton() async {
    if (!isCodeSent.value && isValidPhone) {
      await sendSMS();
      isCodeSent.value = true;
      Get.focusScope?.unfocus();
      codeFocusNode.requestFocus();
    } else if (isCodeSent.value && code.value?.length == 6) {
      Get.focusScope?.unfocus();
      UserCredential userCredential = await verifySMS();
      String resUid = userCredential.user!.uid;

      //todo 씁! 아니다 회원가입을 그냥 전번만 받으면 가입시키고
      //todo 활동 하기전 인증 받을 때 '성별', '학생증 사진', '프로필 사진' 을 다 받자
      //todo 그러면 User에 isAuthed 필드로 어디로 보낼지 정하면 될듯??
      //auth 정보를 유저 모델에도 담고
      //auth 승인을 위해 컬렉션은 따로 만들지만 승인되면 User 의 해당 필드도 바꿔주는식 ('성별', '학생증 사진', '프로필 사진')
      // + meInfo 에 카톡 아이디도 받자
      //아 근데 유아이가 고민이네...

      //회원가입
      if (userCredential.additionalUserInfo!.isNewUser == true) {
        await AuthService.to.registerUser(AuthService.to.user.value, resUid);
        await AuthService.to.loginByUid(resUid);
        return;
      }

      //로그인
      UserModel.User? user = await UserService().findOneByUid(resUid);
      user ??= await AuthService.to.registerUser(AuthService.to.user.value, resUid); //if (user == null)
      await AuthService.to.loginByUid(user.uid);
      return;
    }
  }

  Future<void> sendSMS() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String phoneNum = '+82${phone.value!.replaceAll('-', '').substring(1)}';
    confirmationResult = await auth.signInWithPhoneNumber(phoneNum);
    AuthService.to.user.value.phoneNum = phoneNum;
  }

  Future<UserCredential> verifySMS() async {
    return await confirmationResult!.confirm(code.value!);
  }
}