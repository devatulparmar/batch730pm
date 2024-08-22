

import 'package:flutter/material.dart';

const String routeScreen2 = "/Screen2";
const String routeListScreen = "/ListScreen";
const String routeGridViewScreen = "/GridViewScreen";
const String routeTravelScreen = "/TravelScreen";
const String routeScreen3 = "/Screen3";
const String routeLogin = "/Login";
const String routeRegister = "/Register";
const String routeUserDetailsScreen = "/UserDetailsScreen";

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

const String prefIsLogin = 'isLogin';
const String prefAuthToken = 'authToken';