import 'dart:html';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
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
      return Future<XFile>.value(pickedFile);
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