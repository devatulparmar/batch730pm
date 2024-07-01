import 'package:flutter/material.dart';

class MySnackBar {
  static myFunc({
    required BuildContext context,
    required String content,
    Color? backgroundColor,
    Function()? snackBarAction,
    String? snackBarActionLabel,
  }){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: backgroundColor ?? Colors.black,
      padding: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      duration: const Duration(minutes: 5),
      action: SnackBarAction(
        onPressed: snackBarAction ?? (){},
        label: snackBarActionLabel ?? "",
        textColor: Colors.black,
      ),
      showCloseIcon: true,
      closeIconColor: Colors.blue,
      dismissDirection: DismissDirection.none,
    ));
  }

  static showMySnackBar({
    required BuildContext context,
    required String content,
    Color? backgroundColor,
    Function()? snackBarAction,
    String? snackBarActionLabel,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: backgroundColor ?? Colors.black,
        action: SnackBarAction(
          onPressed: snackBarAction ?? () {},
          label: snackBarActionLabel ?? '',
          textColor: Colors.black,
        ),
        elevation: 5,
        showCloseIcon: true,
        padding: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.none,
      ),
    );
  }
}
