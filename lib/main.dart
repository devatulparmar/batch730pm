import 'dart:io';

import 'package:batch730pm/servieces/notification_service.dart';
import 'package:batch730pm/servieces/push_notification_service.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/utils/device_info.dart';
import 'package:batch730pm/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().init();
  if (Platform.isAndroid) {
    await NotificationService().isAndroidPermissionGranted();
  }
  await NotificationService().requestPermissions();
  await NotificationService().configureDidReceiveLocalNotificationSubject();
  await NotificationService().configureSelectNotificationSubject();
  await PushNotificationService().setupInteractedMessage();
  DeviceInformation().getDeviceInfo();

  return runApp(
    MaterialApp(
      navigatorKey: globalNavigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      onGenerateRoute: MyAppRouter.generateRoute,
    ),
  );
}
