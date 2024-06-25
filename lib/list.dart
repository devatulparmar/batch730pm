import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: ListView.separated(
        itemCount: 315,
        itemBuilder: (BuildContext context, int index) {
          index = index + 1;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                index.toString(),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return Container(
            color: Colors.red,
            height: 1,
            width: 200,
          );
        },
      ),
    );
  }
}
