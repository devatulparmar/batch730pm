import 'package:batch730pm/utils/common_snackbar.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLogin = false;
  int? _selectedIndex;
  bool isSelectedItem = false;
  late SharedPreferences _preferences;

  void _simpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          insetPadding: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Hello World!'),
          ),
        );
      },
    );
  }

  void _alertDialog() {
    showDialog(
      context: context,
      barrierLabel: 'barrierLabel',
      anchorPoint: const Offset(250, 0),
      barrierColor: Colors.pink.shade100,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Title text'),
          content: const Text(
            '''
       The framework can call this method multiple times over the lifetime of a StatefulWidget. For example, if the widget is inserted into the tree in multiple locations, the framework will create a separate State object for each location. Similarly, if the widget is removed from the tree and later inserted into the tree again, the framework will call createState again to create a fresh State object, simplifying the 
        lifecycle of State objects. Copied from StatefulWidget.
        ''',
            textAlign: TextAlign.justify,
          ),
          icon: const Icon(Icons.info),
          iconColor: Colors.red,
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          semanticLabel: 'Semantic Label',
          scrollable: true,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
          surfaceTintColor: Colors.red,
          elevation: 25,
          // buttonPadding: EdgeInsets.all(50),
          // contentPadding: EdgeInsets.all(50),
        );
      },
    );
  }

  void _aboutDialog() {
    showDialog(
      context: context,
      barrierLabel: 'barrierLabel',
      barrierColor: Colors.pink.shade100,
      useSafeArea: true,
      builder: (BuildContext context) {
        return const AboutDialog(
          applicationIcon: Icon(Icons.app_blocking),
          applicationName: 'My App',
          applicationVersion: '1.0.0',
          applicationLegalese: '''
       The framework can call this method multiple times over the lifetime of a StatefulWidget. For example, if the widget is inserted into the tree in multiple locations, the framework will create a separate State object for each location. Similarly, if the widget is removed from the tree and later inserted into the tree again, the framework will call createState again to create a fresh State object, simplifying the 
        lifecycle of State objects. Copied from StatefulWidget.
        ''',
          children: [
            Text('Hello'),
            Text('World'),
          ],
        );
      },
    );
  }

  void _logoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Logout'),
          content: const Text('Are you sure want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _preferences.remove(prefIsLogin);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (Route r) => false,
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _showOptions() {
    showBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      backgroundColor: Colors.pink.shade100,
      enableDrag: false,
      elevation: 35,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CloseButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  hintText: "First Name",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    isLogin = _preferences.getBool(prefIsLogin) ?? false;
    setState(() {});
  }

  Future _launchWebURL() async {
    var url = Uri.parse('https://flutter.dev/');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.inAppWebView);
      }
    } catch (e) {
      MySnackBar.showMySnackBar(
        content: 'Could not launch $url',
        backgroundColor: Colors.red,
      );
    }
  }

  Future _launchPhone(String number) async {
    var phone = Uri(scheme: 'tel', path: '+91$number');
    try {
      await launchUrl(phone);
    } catch (e) {
      MySnackBar.showMySnackBar(
        content: 'Could not launch $phone',
        backgroundColor: Colors.red,
      );
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future _launchEmail(String email) async {
    var emailAddress = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(
        {
          'subject': 'this is subject',
          'body': 'This is body part of an email.',
        },
      ),
    );
    try {
      await launchUrl(emailAddress);
    } catch (e) {
      MySnackBar.showMySnackBar(
        content: 'Could not launch $emailAddress',
        backgroundColor: Colors.red,
      );
    }
  }

  Future _launchSMS(String sms) async {
    var number = Uri(
      scheme: 'sms',
      path: '+91$sms',
      queryParameters: {
        'body': 'This is SMS Body',
      },
    );
    try {
      await launchUrl(number);
    } catch (e) {
      MySnackBar.showMySnackBar(
        content: 'Could not launch $number',
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg'),
            ),
            const SizedBox(height: 20),

            // ListView.builder(
            //   itemCount: 5,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (BuildContext context, int index){
            //     return Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: Card(
            //         elevation: 10,
            //         child: ListTile(
            //           title: Text('Item $index'),
            //           tileColor: _selectedIndex == index ? Colors.pink.shade200 : Colors.white,
            //           onTap: () {
            //             setState(() {
            //               _selectedIndex = index; // Update the selected index
            //             });
            //           },
            //         ),
            //       ),
            //     );
            //   },
            // ),

            MyListItem(
              iconData: Icons.select_all,
              title: 'Tic Tac Game',
              isSelected: isSelectedItem,
              onTap: (){
                Navigator.pushNamed(context, routeTicTacGame);
              },
            ),
            MyListItem(
              iconData: Icons.select_all,
              title: 'Segmented Button Screen',
              isSelected: isSelectedItem,
              onTap: (){
                Navigator.pushNamed(context, routeMySegmentedButtonScreen);
              },
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.list,
              title: 'Employee List Screen',
              isSelected: isSelectedItem,
              onTap: (){
                Navigator.pushNamed(context, routeEmployeeListScreen);
              },
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.location_on,
              title: 'Location Screen',
              isSelected: isSelectedItem,
              onTap: (){
                Navigator.pushNamed(context, routeLocationScreen);
              },
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.person,
              title: 'Edit Profile',
              isSelected: isSelectedItem,
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.privacy_tip,
              title: 'Privacy Policy',
              isSelected: isSelectedItem,
              onTap: () {
                _launchWebURL();
              },
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.privacy_tip,
              title: 'Contact Us',
              isSelected: isSelectedItem,
              onTap: () {
                _launchPhone('1234567890');
              },
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.privacy_tip,
              title: 'Email Us',
              isSelected: isSelectedItem,
              onTap: () {
                _launchEmail('info@mayursoftware.in');
              },
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.privacy_tip,
              title: 'SMS Us',
              isSelected: isSelectedItem,
              onTap: () {
                _launchSMS('1234567890');
              },
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.info,
              title: 'About us',
              isSelected: isSelectedItem,
              onTap: () => _aboutDialog(),
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.feedback,
              title: 'Send Feedback',
              isSelected: isSelectedItem,
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.help,
              title: 'Help and Support',
              isSelected: isSelectedItem,
              onTap: () => _showOptions(),
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.travel_explore,
              title: 'Travel Screen',
              isSelected: isSelectedItem,
              onTap: () => Navigator.pushNamed(context, routeTravelScreen),
            ),
            const SizedBox(height: 10),
            isLogin
                ? MyListItem(
                    iconData: Icons.logout,
                    title: 'Logout',
                    isSelected: isSelectedItem,
                    onTap: () => _logoutDialog(),
                  )
                : MyListItem(
                    iconData: Icons.login,
                    title: 'Login',
                    isSelected: isSelectedItem,
                    onTap: () => Navigator.pushNamed(context, routeLogin),
                  ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Made with ❤️ in India\nVersion 1.0.0"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final bool? isVisible;
  final bool isSelected;
  final IconData iconData;
  final String title;
  final void Function()? onTap;

  const MyListItem(
      {Key? key,
      this.isVisible,
      required this.isSelected,
      required this.iconData,
      required this.title,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible ?? true,
      child: Card(
        color: isSelected ? Colors.pink.shade200 : Colors.white,
        child: ListTile(
          leading: Icon(iconData),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
      ),
    );
  }
}
