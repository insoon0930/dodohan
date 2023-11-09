import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../app/data/enums.dart';
import '../../app/data/info_data.dart';
import '../../app/data/model/user.dart';
import '../../app/data/service/user_service/service.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;

class FcmService extends GetxService {
  static FcmService get to => Get.find<FcmService>();

  final UserService _userService = UserService();
  User get user => AuthService.to.user.value;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel androidNotificationChannel;

  void init() async {
    await initLocalNotificationEvent();
    initFcmEvent();
  }

  Future<void> initLocalNotificationEvent() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings("@mipmap/launcher_icon"),
          iOS: DarwinInitializationSettings(),
        ),
        // onSelectNotification: (String payload) {},
      );

      if (Platform.isAndroid) {
        AndroidNotificationChannel channel = const AndroidNotificationChannel(
          'high_importance_channel', // id
          '알림', // title
          description: 'This channel is used for important notifications.', // description
          importance: Importance.max,
        );
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel);
        androidNotificationChannel = channel;
      }

      if (Platform.isIOS) {
        await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
          alert: false,
          badge: false,
          sound: false,
        );
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void initFcmEvent() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    final String? deviceToken = await firebaseMessaging.getToken();
    if (deviceToken != user.fcmToken) {
      await _userService.updateFcmToken(user.id, deviceToken);
    }

    firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        handleFcmMessage(message);
      }
    });

    FirebaseMessaging.onMessage.listen(handleFcmMessage);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleBackgroundPushNotification(message);
    });
  }

  handleFcmMessage(RemoteMessage message) async {
    RemoteNotification notification = message.notification!;

    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      message.notification!.title?.isEmpty == true ? '두근두근캠퍼스' : message.notification!.title,
      message.notification!.body,
      NotificationDetails(
        android: Platform.isAndroid ? AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: androidNotificationChannel.description,
          icon: '@mipmap/launcher_icon',
          importance: Importance.max,
          priority: Priority.max,
          enableLights: true,
          visibility: NotificationVisibility.public,
        ) : null,
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: json.encode({
        'data': message.data,
        'notification': {
          'title': message.notification?.title ?? '',
          'body': message.notification?.body ?? '',
          'show_in_foreground': true
        }
      }),
    );
  }

  void handleBackgroundPushNotification(RemoteMessage message) {
    final data = message.data;
    // final type = data['type'];

    print('handleBackgroundPushNotification data : $data');
    // if (type != null) {
    //   0.5.delay(() => FARouter.navigateTo(message.data));
    // }
  }

  void sendFcmPush(String receiverId, FcmPushType type) {
    var url = Uri.parse('https://fcmpush-m2rvoqphsq-uc.a.run.app');
    Map<String, dynamic> data = {
      'receiverId': receiverId,
      'type': type.name, //지금 안쓰긴 함
      'title': '두근두근${InfoData.univInfo[user.univ]?.appTitleTail}',
      'body': type.body,
    };
    String encodedData = jsonEncode(data);
    http.post(url, body: encodedData, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
  }
}