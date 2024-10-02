import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await Firebase.initializeApp();
  } catch(e){
    print(e);
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
