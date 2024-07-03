import 'package:batch730pm/utils/common_snackbar.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/login.dart';
import 'package:batch730pm/screen2.dart';
import 'package:batch730pm/widgets/common_drawer.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  ListView _listviewWidget(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              MySnackBar.showMySnackBar(context: context, content: "Hello");
              // Navigator.pushNamed(
              //   context,
              //   routeLogin,
              // );
            },
            child: const Text('Login'),
          ),
        ),
        const SizedBox(height: 15),
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
            child: const Text('Screen2'),
          ),
        ),   const SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            onPressed: () {
              print('Clicked');

              Navigator.pushNamed(
                context,
                listScreen,
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
            child: const Text('ListScreen'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batch 7:30 PM'),
      ),
      endDrawer: const CommonDrawer(),
      drawer: const CommonDrawer(),
      body: _listviewWidget(context),
    );
  }
}
