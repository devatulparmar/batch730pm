
import 'dart:convert';
import 'dart:io';
import 'package:batch730pm/servieces/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';


/// use only in debug mode
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (message.notification == null) {
    NotificationService().showNotifications(title: message.data["title"], description: message.data["description"], messageData: message.data);
  }
}

class PushNotificationService {
  Future<void> setupInteractedMessage() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final messagingInstance = FirebaseMessaging.instance;

    NotificationSettings settings = await messagingInstance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if(Platform.isAndroid){
        final token = await messagingInstance.getToken();
        debugPrint('FCM token :: $token');
      }
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        debugPrint('onMessage :: $message');
        if (message.notification == null) {
          NotificationService().showNotifications(title: message.data["title"], description: message.data["description"], messageData: message.data);
        } else {
          NotificationService().showNotifications(title: message.notification?.title, description: message.notification?.body, messageData: message.data);
        }
      });

      // messagingInstance.getInitialMessage().then((RemoteMessage? message) {
      //   debugPrint('message :: $message');
      //   if (message != null) {
      //     if (message.notification == null) {
      //       NotificationService().showNotifications(title: message.data["title"], description: message.data["description"], messageData: message.data);
      //     } else {
      //       NotificationService().showNotifications(title: message.notification?.title, description: message.notification?.body, messageData: message.data);
      //     }
      //   }
      // });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        ///add stream payload when app is in background
        selectNotificationStream.add(jsonEncode(message.data));
      });
    }
  }
}