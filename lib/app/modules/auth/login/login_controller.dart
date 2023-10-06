import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/model/user.dart' as UserModel;
import 'package:stamp_now/app/widgets/dialogs/error_dialog.dart';
import '../../../../core/services/auth_service.dart';
import '../../../data/service/user_service/service.dart';

class LoginController extends GetxController {
  final UserService _userService = UserService();
  
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

  Future<void> onTapSMSButtonInWeb() async {
    //   Get.offAllNamed(Routes.admin);
    //   return;
    // print('??');
    // await AuthService.to.loginByUid('xIK278QzSvOry7IAjExUE6FteTm2');
    // return;

    if (!isCodeSent.value && isValidPhone) {
      if(kIsWeb) {
        Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
        await sendSMS();
        Get.back();
        isCodeSent.value = true;
        Get.focusScope?.unfocus();
        codeFocusNode.requestFocus();
      }
    } else if (isCodeSent.value && code.value?.length == 6) {
      Get.focusScope?.unfocus();
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
      UserCredential userCredential = await verifySMS();
      String resUid = userCredential.user!.uid;

      //탈퇴회원 재가입 제한
      final UserModel.User? deletedUser = await _userService.findOneByPhoneNum(
          '+82${phone.value!.replaceAll('-', '').substring(1)}');
      if((deletedUser != null) && (DateTime.now().difference(deletedUser.deletedAt!) < const Duration(days: 30))) {
        Get.back();
        Get.dialog(ErrorDialog(text: '재가입이 30일간 제한되었습니다\n(남은 기간: ${30 - DateTime.now().difference(deletedUser.deletedAt!).inDays}일)'));
        return;
      }

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

  Future<void> onTapSMSButtonInMobile() async {
    print('???????? : ${'+82${phone.value!.replaceAll('-', '').substring(1)}'}');
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+82${phone.value!.replaceAll('-', '').substring(1)}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('verificationCompleted: $credential');
        // // ANDROID ONLY!
        //
        // // Sign the user in (or link) with the auto-generated credential
        // UserCredential userCredential = await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('verificationFailed: ${e}');
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        print('codeSent: $verificationId, $resendToken');
        // // Update the UI - wait for the user to enter the SMS code
        // String smsCode = 'xxxx';
        //
        // // Create a PhoneAuthCredential with the code
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        //
        // // Sign the user in (or link) with the credential
        // await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );


    if (!isCodeSent.value && isValidPhone) {
      if(kIsWeb) {
        Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
        await sendSMS();
        Get.back();
        isCodeSent.value = true;
        Get.focusScope?.unfocus();
        codeFocusNode.requestFocus();
      }
    } else if (isCodeSent.value && code.value?.length == 6) {
      Get.focusScope?.unfocus();
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
      UserCredential userCredential = await verifySMS();
      String resUid = userCredential.user!.uid;

      //탈퇴회원 재가입 제한
      final UserModel.User? deletedUser = await _userService.findOneByPhoneNum(
          '+82${phone.value!.replaceAll('-', '').substring(1)}');
      if((deletedUser != null) && (DateTime.now().difference(deletedUser.deletedAt!) < const Duration(days: 30))) {
        Get.back();
        Get.dialog(ErrorDialog(text: '재가입이 30일간 제한되었습니다\n(남은 기간: ${30 - DateTime.now().difference(deletedUser.deletedAt!).inDays}일)'));
        return;
      }

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
