import 'package:batch730pm/home_screen.dart';
import 'package:batch730pm/login.dart';
import 'package:batch730pm/register_screen.dart';
import 'package:batch730pm/sales_screen.dart';
import 'package:batch730pm/screen2.dart';
import 'package:flutter/material.dart';

class MyBottomNavScreen extends StatefulWidget {
  const MyBottomNavScreen({super.key});

  @override
  State<MyBottomNavScreen> createState() => _MyBottomNavScreenState();
}

class _MyBottomNavScreenState extends State<MyBottomNavScreen> {
  int selectedIndex = 0;

  final List _list = [
    const LoginScreen(),
    const Screen2(),
    const RegisterScreen(),
    const RegisterScreen(),
    const SaleScreen()
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
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '',
            tooltip: 'Home',
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
            icon: Icon(Icons.favorite),
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
    );
  }
}
