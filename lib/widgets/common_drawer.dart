
import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
