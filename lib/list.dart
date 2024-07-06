import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List _list = [];
  List<Widget> _list3 = [];
  List _list2 = [
    "Vadodara",
    "Surat",
    "Rajkot",
  ];

  @override
  void initState() {
    super.initState();
    _calculate();
  }

  void _calculate() {
    for (int i = 0; i < 50; i++) {
      _list.add(i);
    }

  }

  @override
  Widget build(BuildContext context) {

    // _list3 = List.generate(50, (int index){
    //   return Padding(
    //     padding: const EdgeInsets.all(10),
    //     child: Center(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text("Hello"),
    //           Text("Hello"),
    //           Text(index.toString()),
    //           IconButton(
    //             onPressed: () {
    //               // _list.removeAt(index);
    //               // _list.remove(_list[index]);
    //               setState(() {});
    //             },
    //             icon: Icon(
    //               Icons.delete,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // });

    return Scaffold(
        appBar: AppBar(
          title:const Text('List Screen'),
          actions: [
            IconButton(
              onPressed: () {
                _list.clear();
                setState(() {});
              },
              icon: Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
        body: ListView(
          children: List.generate(50, (int index){
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hello"),
                    Text("Hi"),
                    Text(index.toString()),
                    IconButton(
                      onPressed: () {
                        // _list.removeAt(index);
                        // _list.remove(_list[index]);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
        actions: [
          IconButton(
            onPressed: () {
              _list.clear();
              setState(() {});
            },
            icon: Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _list.length,
        // reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _list[index].toString(),
                  ),
                  Text(
                    _list.contains(9).toString(),
                  ),
                  IconButton(
                    onPressed: () {
                      // _list.removeAt(index);
                      // _list.remove(_list[index]);
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.red,
            height: 1,
            width: 200,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _list.add(55);
          // _list.addAll(_list2);
          // _list.shuffle();
          // print(_list.first);
          // print(_list.last);
          // _list.removeLast();
          // print(_list.isEmpty);
          // print(_list.isNotEmpty);
          // _list.reversed.toList().toSet();
          print(_list.contains(85));
          setState(() {});
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
