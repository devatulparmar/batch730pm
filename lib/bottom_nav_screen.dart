import 'package:batch730pm/home_screen.dart';
import 'package:batch730pm/login.dart';
import 'package:batch730pm/nested_screen.dart';
import 'package:batch730pm/profile_screen.dart';
import 'package:batch730pm/register_screen.dart';
import 'package:batch730pm/sales_screen.dart';
import 'package:batch730pm/search_screen.dart';
import 'package:batch730pm/user_details.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBottomNavScreen extends StatefulWidget {
  const MyBottomNavScreen({super.key});

  @override
  State<MyBottomNavScreen> createState() => _MyBottomNavScreenState();
}

class _MyBottomNavScreenState extends State<MyBottomNavScreen> {
  int selectedIndex = 0;

  final List _list = [
    const HomeScreen(),
    const SearchScreen(),
    const RegisterScreen(),
    const RegisterScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list.elementAt(selectedIndex),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedIndex,
      //   backgroundColor: Colors.white,
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.green,
      //   type: BottomNavigationBarType.fixed,
      //   iconSize: 35,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.search,
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.settings,
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.favorite_border_outlined,
      //         ),
      //         activeIcon:  Icon(
      //           Icons.favorite,
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.person,
      //         ),
      //         label: ''),
      //   ],
      //   onTap: (int? index) {
      //     selectedIndex = index!;
      //     setState(() {});
      //   },
      // ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Colors.white,
        elevation: 100,
        height: 50,
        shadowColor: Colors.red,
        animationDuration: const Duration(seconds: 2),
        surfaceTintColor: Colors.red,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '',
            // tooltip: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: '',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('10+'),
              child: Icon(Icons.notifications),
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              isLabelVisible: true,
              textStyle: txtStyle,
              // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              // largeSize: 35,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (int? index) {
          setState(() {
            selectedIndex = index!;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('clicked');
        },
        icon: const Icon(Icons.add),
        label: const Text('Add New Task'),
      ),
    );
  }
}
