import 'package:batch730pm/utils/const.dart';
import 'package:flutter/material.dart';

class MySnackBar {
  static showMySnackBar({
    required String content,
    Color? backgroundColor,
    SnackBarAction? snackBarAction,
  }) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: backgroundColor ?? Colors.black,
        action: snackBarAction,
        elevation: 5,
        showCloseIcon: true,
        padding: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        duration: const Duration(seconds: 10),
        dismissDirection: DismissDirection.none,
      ),
    );
    // return ScaffoldMessenger.of(globalNavigatorKey.currentContext!).showSnackBar(
    //   SnackBar(
    //     content: Text(content),
    //     backgroundColor: backgroundColor ?? Colors.black,
    //     action: snackBarAction,
    //     elevation: 5,
    //     showCloseIcon: true,
    //     padding: const EdgeInsets.all(10),
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(35),
    //     ),
    //     duration: const Duration(seconds: 3),
    //     dismissDirection: DismissDirection.none,
    //   ),
    // );
  }
}
