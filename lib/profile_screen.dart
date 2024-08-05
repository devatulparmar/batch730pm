import 'package:batch730pm/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLogin = false;
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
            const MyListItem(iconData: Icons.person, title: 'Edit Profile'),
            const SizedBox(height: 10),
            const MyListItem(iconData: Icons.privacy_tip, title: 'Privacy Policy'),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.info,
              title: 'About us',
              onTap: () => _aboutDialog(),
            ),
            const SizedBox(height: 10),
            const MyListItem(iconData: Icons.feedback, title: 'Send Feedback'),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.help,
              title: 'Help and Support',
              onTap: () => _showOptions(),
            ),
            const SizedBox(height: 10),
            MyListItem(
              iconData: Icons.travel_explore,
              title: 'Travel Screen',
              onTap: () => Navigator.pushNamed(context, routeTravelScreen),
            ),
            const SizedBox(height: 10),
            isLogin
                ? MyListItem(
                    iconData: Icons.logout,
                    title: 'Logout',
                    onTap: () => _logoutDialog(),
                  )
                : MyListItem(
                    iconData: Icons.login,
                    title: 'Login',
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
  final IconData iconData;
  final String title;
  final void Function()? onTap;
  const MyListItem(
      {Key? key,
      this.isVisible,
      required this.iconData,
      required this.title,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible ?? true,
      child: Card(
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
