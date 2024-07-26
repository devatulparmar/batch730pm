import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
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
