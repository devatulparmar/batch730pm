import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview'),
      ),
      body: GridView.builder(
        reverse: true,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
          // maxCrossAxisExtent: 250,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 40,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(350),
              side: BorderSide(color: Colors.blue, width: 5)
            ),
            shadowColor: Colors.green,
            child: Center(
              child: Text('Hello $index'),
            ),
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.green,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.yellow,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.blueAccent,
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
