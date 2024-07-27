import 'package:batch730pm/utils/common_snackbar.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/login.dart';
import 'package:batch730pm/screen2.dart';
import 'package:batch730pm/widgets/common_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListView _listviewWidget(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              // MySnackBar.showMySnackBar(context: context, content: "Hello");
              Navigator.pushNamed(
                context,
                routeRegister,
              );
            },
            child: const Text('Register'),
          ),
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // MySnackBar.showMySnackBar(context: context, content: "Hello");
              Navigator.pushNamed(
                context,
                routeLogin,
              );
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
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            onPressed: () {
              print('Clicked');

              Navigator.pushNamed(
                context,
                routeListScreen,
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
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            onPressed: () {
              print('Clicked');

              Navigator.pushNamed(
                context,
                routeGridViewScreen,
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
            child: const Text('GridViewScreen'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: 15,
            padding: const EdgeInsets.all(10),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 600,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Title $index',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.more_vert),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: const [
                          Text(
                            'Sub Title',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}
