import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final Location _location = Location();
  bool isLocationServiceEnabled = false;
  PermissionStatus? _permissionStatus;


  Future<void> _getLocation() async{
    var locationData = await _location.getLocation();
    print(locationData);
  }

  Future _checkPermissionGranted() async{
    print('called');
    _permissionStatus = await _location.hasPermission();

    print('_permissionStatus $_permissionStatus');
    if(_permissionStatus == PermissionStatus.denied){
      await _location.requestPermission();

      if(_permissionStatus == PermissionStatus.denied){
        AppSettings.openAppSettings(type: AppSettingsType.location);
      }
    }
    else if(_permissionStatus == PermissionStatus.deniedForever){
      /// open app settings
      AppSettings.openAppSettings(type: AppSettingsType.location);
    }
    else {
      if(_permissionStatus == PermissionStatus.deniedForever){
        AppSettings.openAppSettings(type: AppSettingsType.location);
      }
      return;
    }
  }

  Future _checkLocationStatus() async{
    isLocationServiceEnabled = await _location.serviceEnabled();
    if(!isLocationServiceEnabled){
      await _location.requestService();
      if(!isLocationServiceEnabled){
        _checkLocationStatus();
      }
    }
    else{
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLocationStatus().whenComplete((){
      _checkPermissionGranted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _getLocation();
            },
            child: const Text('Get Location'),
          ),

          const Text('Location : '),
        ],
      ),
    );
  }
}
