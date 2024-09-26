import 'dart:convert';
import 'dart:io';

import 'package:batch730pm/model/users_model.dart';
import 'package:batch730pm/repository/api_repository.dart';
import 'package:batch730pm/utils/common_snackbar.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/login.dart';
import 'package:batch730pm/screen2.dart';
import 'package:batch730pm/widgets/common_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List tempList = [];
  List _carouselSliderList = [1, 2, 3, 4, 5];

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

  Future _getData() async {
    var response = await ApiRepository()
        .getAPIRequest('https://reqres.in/api/users') as Response;
    // Response response = await http.get(
    //   Uri.parse('https://reqres.in/api/users'),
    // );

    if (response.statusCode == 200) {
      print('api called');
      var decodedData = jsonDecode(response.body);
      tempList = decodedData['data'] as List;
      _userList =
          tempList.map((dynamic obj) => UserData.fromJson(obj)).toList();
      setState(() {});
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _getData,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 1),
                    aspectRatio: 3/1,
                  ),
                  items: _carouselSliderList.map((dynamic i) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Image.network(
                        'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  }).toList(),
                ),
                ListView.builder(
                  itemCount: _userList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  physics: const NeverScrollableScrollPhysics(),
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
                                  style: txtStyle,
                                ),
                                const Icon(Icons.more_vert),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
