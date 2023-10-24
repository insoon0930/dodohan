import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class Utility {

  static String randomString(int length) {
    var charSet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var randomString = '';
    for (var i = 0; i < length; i++) {
      var randomPoz = (Random.secure().nextDouble() * charSet.length).floor();
      randomString += charSet.substring(randomPoz, randomPoz + 1);
    }
    return randomString;
  }

  static String formatPhoneNum(String phoneNum) {
    return phoneNum.replaceAllMapped(
        RegExp(r'^\+82(\d{2})(\d{4})(\d{4})$'),
            (match) => '0${match[1]}-${match[2]}-${match[3]}'
    );
  }

  static Future<XFile?> getImage({ImageSource source = ImageSource.gallery}) async {
    if (!kIsWeb) {
      final Permission requiredPermission;
      if(source == ImageSource.camera) {
        requiredPermission = Permission.camera;
      } else {
        requiredPermission = Permission.photos;
      }
      final hasPermission = await Utility.handlePermission(requiredPermission);
      if(!hasPermission) {
        return null;
      }
    }
    final ImagePicker picker = ImagePicker();
    try {
      XFile? pickedFile = await picker.pickImage(source: source, maxWidth: 2048, maxHeight: 2048, imageQuality: 100);
      if(pickedFile == null) {
        return Future.value(null);
      }

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '사진 편집',
              toolbarColor: Colors.black26,
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: true,
          ),
          IOSUiSettings(minimumAspectRatio: 1.0),
          WebUiSettings(
            context: Get.context!,
            presentStyle: CropperPresentStyle.page,
            boundary: const CroppieBoundary(width: 400, height: 400),
            viewPort: const CroppieViewPort(width: 300, height: 300),
            enableZoom: true,
            enforceBoundary: true,
            showZoomer: false,
            translations: const WebTranslations(
                title: '',
                rotateLeftTooltip: '',
                rotateRightTooltip: '',
                cancelButton: '',
                cropButton: '')),
        ],
      );
      if(croppedFile == null) {
        return Future.value(null);
      }

      return Future<XFile>.value(XFile(croppedFile.path));
    } catch (e) {
      return Future.value(null);
    }
  }

  static Future<dynamic> handlePermission(Permission permission) async {
    PermissionStatus permissionStatus = await permission.status;
    if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
      permissionStatus = await permission.request();

      if (permissionStatus.isDenied) {
        // return Get.dialog(PermissionDeniedDialog(permission: permission, permanentlyDenied: false,),barrierColor: Color(0xffffffff).withOpacity(.7));
      } else if (permissionStatus.isPermanentlyDenied) {
        // return Get.dialog(PermissionDeniedDialog(permission: permission, permanentlyDenied: true,),barrierColor: Color(0xffffffff).withOpacity(.7));
      }
    } else if (permissionStatus.isRestricted) {
      // return Get.dialog(PermissionRestrictedDialog(),barrierColor: Color(0xffffffff).withOpacity(.7));
    }
    return true;
  }
}