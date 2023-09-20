import 'dart:js' as js;

import 'package:js/js_util.dart';

import 'js_library.dart';

class JSHelper {
  /// This method name inside 'getPlatform' should be same in JavaScript file
  String getPlatformFromJS() {
    print("getPlatformFromJS is called from 'web'");
    return js.context.callMethod('getPlatform');
  }

  Future<dynamic> callJSPromise(
      {required int amount,
      required String orderId,
      required String orderName}) async {
    return await promiseToFuture(jsPromiseFunction(amount, orderId, orderName));
  }

  Future<String> callOpenTab() async {
    return await promiseToFuture(jsOpenTabFunction('https://google.com/'));
  }
}
