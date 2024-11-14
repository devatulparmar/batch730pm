import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceInformation {
  void getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      debugPrint('Running on device ${androidInfo.device}');
      debugPrint('Running on model ${androidInfo.model}');
      debugPrint('Running on display ${androidInfo.display}');
      debugPrint('Running on data ${androidInfo.data}');
      debugPrint('Running on brand ${androidInfo.brand}');
      debugPrint('Running on bootloader ${androidInfo.bootloader}');
      debugPrint('Running on fingerprint ${androidInfo.fingerprint}');
      debugPrint('Running on board ${androidInfo.board}');
      debugPrint('Running on host ${androidInfo.host}');
      debugPrint('Running on id ${androidInfo.id}');
      debugPrint('Running on hashCode ${androidInfo.hashCode}');
    }
    else if (Platform.isIOS) {
      debugPrint('Hello');
      var iosInfo = await deviceInfo.iosInfo;
      debugPrint('identifierForVendor :: ${iosInfo.identifierForVendor}');
      debugPrint('name :: ${iosInfo.name}');
    }
  }
}
