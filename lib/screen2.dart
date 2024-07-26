import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/screen3.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

void fn(){
  Navigator.push(
    globalNavigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (BuildContext c) {
        return const Screen3();
      },
    ),
  );
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.logout,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Screen 2'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                print('Clicked');

                Navigator.pushNamed(
                  context,
                  routeRegister,
                  // (Route r) => false,
                );

                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext c) {
                //       return Screen3();
                //     },
                //   ),
                // );

                //
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext c) {
                //       return const Screen3();
                //     },
                //   ),
                // );
                //
                // Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (BuildContext c) {
                //         return const Screen3();
                //       },
                //     ),
                // );
              },
              child: const Text('Go to Screen 2'),
            ),
          ),
        ],
      ),
    );
  }
}
