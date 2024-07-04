import 'package:flutter/material.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  bool isHomeSelected = false;
  bool isListSelected = false;
  bool isImageSelected = false;

  Widget commonListTile({
    required Widget icon,
    required String title,
    required bool isSelected,
    Function()? onTap,
  }) {
    return ListTile(
      leading: icon,
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      title: Text(title),
      selectedColor: Colors.white,
      selectedTileColor: Colors.blueAccent,
      tileColor: Colors.grey,
      textColor: Colors.white,
      iconColor: Colors.white,
      selected: isSelected,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: 500,
      child: ListView(
        children: [
          commonListTile(
            icon: const Icon(Icons.home),
            title: 'Home Screen',
            isSelected: isHomeSelected,
            onTap: () {
              isHomeSelected = true;
              isListSelected = false;
              isImageSelected = false;
              setState(() {});
            },
          ),
          commonListTile(
            icon: const Icon(Icons.list),
            title: 'List Screen',
            isSelected: isListSelected,
            onTap: () {
              isHomeSelected = false;
              isImageSelected = false;
              isListSelected = true;
              setState(() {});
            },
          ),
          commonListTile(
            icon: const Icon(Icons.image),
            title: 'Image Screen',
            isSelected: isImageSelected,
            onTap: () {
              isHomeSelected = false;
              isListSelected = false;
              isImageSelected = true;
              setState(() {});
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.arrow_forward_ios,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            title: Text("title"),
            selectedColor: Colors.white,
            selectedTileColor: Colors.blueAccent,
            tileColor: Colors.grey,
            textColor: Colors.white,
            iconColor: Colors.white,
            selected: isHomeSelected,
            // onTap: onTap,
          ),
        ],
      ),
    );
  }
}
