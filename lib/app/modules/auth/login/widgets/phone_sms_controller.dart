import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/core/controllers/auth_controller.dart';

import '../../../../../routes/app_routes.dart';

class PhoneSMSController extends GetxController {
  final Rxn<String> phone = Rxn<String>();
  final RxBool isCodeSent = false.obs;
  final Rxn<String> code = Rxn<String>();
  final RxBool isAuthSucceed = false.obs;

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
      isAuthSucceed.value = true;
      AuthController.to.loginByUid(userCredential.user!.uid);
      Get.toNamed(Routes.meInfo);
    }
  }

  Future<void> sendSMS() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    confirmationResult = await auth.signInWithPhoneNumber(
        '+82${phone.value!.replaceAll('-', '').substring(1)}');
  }

  Future<UserCredential> verifySMS() async {
    return await confirmationResult!.confirm(code.value!);
  }
}