import 'dart:convert';

import 'package:batch730pm/model/users_model.dart';
import 'package:batch730pm/repository/api_repository.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List tempList = [];

  List<UserData> _userList = [];
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

  Future<List<UserData>> _getData() async {
    var response = await ApiRepository()
        .getAPIRequest('https://reqres.in/api/users') as Response;
    // Response response = await http.get(
    //   Uri.parse('https://reqres.in/api/users'),
    // );

    if (response.statusCode == 200) {
      print('api called');
      var decodedData = jsonDecode(response.body);
      tempList = decodedData['data'] as List;
      _userList = tempList.map((dynamic obj) => UserData.fromJson(obj)).toList();
      setState(() {});
      return _userList;
    } else {
      print(response.statusCode);
    }
    return _userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
              itemCount: _userList.length,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fist Name: ${_userList[index].firstName}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Icon(Icons.more_vert),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
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
            );
          }
          else if (snapShot.hasError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
