import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/model/user.dart' as UserModel;
import '../../../../core/services/auth_service.dart';
import '../../../data/service/user_service/service.dart';

class LoginController extends GetxController {
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
    //   Get.offAllNamed(Routes.admin);
    //   return;
    //   await AuthService.to.loginByUid('lQCQOt9dtFUlZ9r17FjnwYtUeXs2');
    //   return;

    if (!isCodeSent.value && isValidPhone) {
      await sendSMS();
      isCodeSent.value = true;
      Get.focusScope?.unfocus();
      codeFocusNode.requestFocus();
    } else if (isCodeSent.value && code.value?.length == 6) {
      Get.focusScope?.unfocus();
      Get.dialog(const Center(child: CircularProgressIndicator()));
      UserCredential userCredential = await verifySMS();
      String resUid = userCredential.user!.uid;

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
