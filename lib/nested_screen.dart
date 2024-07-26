import 'package:batch730pm/login.dart';
import 'package:batch730pm/register_screen.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/utils/routes.dart';
import 'package:flutter/material.dart';

class NestedScreen extends StatefulWidget {
  const NestedScreen({Key? key}) : super(key: key);

  @override
  State<NestedScreen> createState() => _NestedScreenState();
}

class _NestedScreenState extends State<NestedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Navigator(
      onGenerateRoute: MyAppRouter.generateNestedRoute,
    );
  }
}