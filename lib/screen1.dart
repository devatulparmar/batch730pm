import 'package:batch730pm/utils/const.dart';
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
      endDrawer: Drawer(
        // width: 500,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: (){
                print('clicked here');
              },
              child: Container(
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Menu 1'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                print('clicked inkwell');
              },

              child: Container(
                // color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Menu 1'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Menu 1'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Clicked');
                      },
                      child: Text(
                        'Menu button',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Menu 1'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // width: 500,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: (){
                print('clicked here');
              },
              onDoubleTap: (){
                print('on double tap');
              },

              child: Container(
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Menu 1'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                print('clicked inkwell');
              },

              child: Container(
                // color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Menu 1'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Menu 1'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Clicked');
                      },
                      child: Text(
                        'Menu button',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Menu 1'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
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
