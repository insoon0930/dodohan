import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/services/auth_service.dart';
import '../../../../../routes/app_routes.dart';

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
      print('aaa');
      isCodeSent.value = true;
      print('bbb');
      Get.focusScope?.unfocus();
      print('ccc');
      codeFocusNode.requestFocus();
      print('ddd');
    } else if (isCodeSent.value && code.value?.length == 6) {
      Get.focusScope?.unfocus();
      print('userCredential??!!!');
      UserCredential userCredential = await verifySMS();
      print('userCredential1 :$userCredential');
      print('userCredential2 :${userCredential.user?.uid}');
      if (userCredential.additionalUserInfo!.isNewUser == true) {
        Get.toNamed(Routes.register);
        return;
      }
      print('userCredential3 ');
      await AuthService.to.loginByUid(userCredential.user!.uid);
      print('userCredential4 ');
    }
  }

  Future<void> sendSMS() async {
    print('sendSMS??!!!');
    FirebaseAuth auth = FirebaseAuth.instance;
    confirmationResult = await auth.signInWithPhoneNumber(
        '+82${phone.value!.replaceAll('-', '').substring(1)}');
    print('confirmationResult: $confirmationResult');
  }

  Future<UserCredential> verifySMS() async {
    return await confirmationResult!.confirm(code.value!);
  }
}