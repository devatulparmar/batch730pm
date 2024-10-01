import 'dart:async';

import 'package:flutter/material.dart';

class MyStreamScreen extends StatefulWidget {
  const MyStreamScreen({super.key});

  @override
  State<MyStreamScreen> createState() => _MyStreamScreenState();
}

class _MyStreamScreenState extends State<MyStreamScreen> {
  final StreamController _streamController = StreamController();

  Stream get _streamObject => _streamController.stream;

  @override
  void initState() {
    super.initState();
    _streamController.add({"id": 1561468533});
  }

  void getValue() {
    _streamObject.listen(
      (value) {
        print("value $value");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              getValue();
            },
            child: const Text('Get the value'),
          ),
        ],
      ),
    );
  }
}
