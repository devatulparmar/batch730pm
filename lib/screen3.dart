
import 'package:batch730pm/login.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                print('Clicked');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext c) {
                      return LoginScreen();
                    },
                  ),
                );

                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext c) {
                //       return LoginScreen();
                //     },
                //   ),
                //   (Route route) {
                //     return false;
                //   },
                // );
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
