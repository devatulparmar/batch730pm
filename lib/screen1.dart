import 'package:batch730pm/const.dart';
import 'package:batch730pm/login.dart';
import 'package:batch730pm/screen2.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Batch 7:30 PM'),
      ),
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  routeLogin,
                );
              },
              child: Text('Login'),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                print('Clicked');

                Navigator.pushNamed(
                  context,
                  routeScreen2,
                );

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext c) {
                //       return Screen2();
                //     },
                //   ),
                // );
              },
              child: Text('Screen2'),
            ),
          ),
        ],
      ),
    );
  }
}
