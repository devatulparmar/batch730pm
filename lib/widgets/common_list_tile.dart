import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  const CommonListTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.isSelected,
      this.onTap,
      })
      : super(key: key);

  final Widget icon;
  final String title;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
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
}
