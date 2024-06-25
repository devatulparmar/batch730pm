import 'package:batch730pm/const.dart';
import 'package:batch730pm/gridview.dart';
import 'package:batch730pm/image.dart';
import 'package:batch730pm/list.dart';
import 'package:batch730pm/login.dart';
import 'package:batch730pm/my_app.dart';
import 'package:batch730pm/sales_screen.dart';
import 'package:batch730pm/screen1.dart';
import 'package:batch730pm/screen2.dart';
import 'package:batch730pm/screen3.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
      '/': (BuildContext context) => const SaleScreen(),
      routeScreen2: (BuildContext context) => Screen2(),
      routeScreen3: (BuildContext context) => Screen3(),
    },
  )
);

