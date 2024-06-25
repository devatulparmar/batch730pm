import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFD500F9),
          title: Text("My App"),
          centerTitle: false,
        ),
        body: Wrap(
          alignment: WrapAlignment.end,
          direction: Axis.vertical,
          children: [
            Container(
              height: 200,
              width: 100,
              color: Colors.orange,
              child: Text('1'),
            ),
            Container(
              height: 200,
              width: 100,
              color: Colors.pink,
              child: Text('2'),
            ),
            Container(
              height: 200,
              width: 100,
              color: Colors.green,
              child: Text('3'),
            ),
            Container(
              height: 200,
              width: 100,
              color: Colors.blue,
              child: Text('4'),
            ),
            Container(
              height: 200,
              width: 100,
              color: Colors.yellow,
              child: Text('5'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print('Hello');
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: CloseButton(
            onPressed: () {},
          ),
          title: Text('Home Screen'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  print('Icon clicked');
                },
                icon: Icon(Icons.dashboard)),
            IconButton(
                onPressed: () {
                  print('Icon clicked');
                },
                icon: Icon(Icons.refresh)),
          ],
          elevation: 0,
          leadingWidth: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                color: Colors.red,
                height: 200,
                width: 200,
              ),
              Container(
                color: Colors.blueAccent,
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
