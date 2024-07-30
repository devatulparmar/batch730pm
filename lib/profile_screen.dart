import 'package:batch730pm/utils/const.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      anchorPoint: Offset(250, 0),
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
        });
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
                    onPressed: (){
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

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //   width: MediaQuery.of(context).size.width,
    //   color: Colors.pink,
    // );

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 100,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg'),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About us'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _aboutDialog();
              },
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Send Feedback'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help and Support'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showOptions();
              },
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  routeLogin,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // _simpleDialog();
                // _alertDialog();
                _logoutDialog();
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: const [
                Text("Made with ❤️ in India\nVersion 1.0.0"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
