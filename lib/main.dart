import 'dart:io';

import 'package:batch730pm/servieces/notification_service.dart';
import 'package:batch730pm/servieces/push_notification_service.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAQhqapx5_Thf7uV-OA05UTjGj8TSfV-N0",
          appId: "1:665381692579:android:360fc23be9674a7a87cb16",
          messagingSenderId: '',
          projectId: "batch730pm-20747",
      ),
    );
    await NotificationService().init();
    if (Platform.isAndroid) {
      await NotificationService().isAndroidPermissionGranted();
    }
    await NotificationService().requestPermissions();
    await NotificationService().configureDidReceiveLocalNotificationSubject();
    await NotificationService().configureSelectNotificationSubject();
    await PushNotificationService().setupInteractedMessage();
  } catch (e) {
    rethrow;
  }

  return runApp(
    MaterialApp(
      navigatorKey: globalNavigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: MyAppRouter.generateRoute,
    ),
  );
}
