import 'package:batch730pm/widgets/common_container.dart';
import 'package:batch730pm/widgets/common_list_tile.dart';
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

  Widget commonListTileFunction({
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
          CommonListTile(
            icon: const Icon(Icons.home),
            title: 'Home Screen',
            isSelected: isHomeSelected,
          ),
          commonListTileFunction(
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
          commonListTileFunction(
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
          commonListTileFunction(
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
          CommonListTile(
            icon: const Icon(Icons.arrow_forward_ios),
            title: "title",
            isSelected: isHomeSelected,
            // onTap: ,
          ),
          ListTile(
            leading: const Icon(
              Icons.arrow_forward_ios,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            title: const Text("title"),
            selectedColor: Colors.white,
            selectedTileColor: Colors.blueAccent,
            tileColor: Colors.grey,
            textColor: Colors.white,
            iconColor: Colors.white,
            selected: isHomeSelected,
            // onTap: onTap,
          ),
          const CommonContainer(
            color: Colors.red,
          ),
          const CommonContainer(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
