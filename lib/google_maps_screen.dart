import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyGoogleMapScreen extends StatefulWidget {
  const MyGoogleMapScreen({super.key});

  @override
  State<MyGoogleMapScreen> createState() => _MyGoogleMapScreenState();
}

class _MyGoogleMapScreenState extends State<MyGoogleMapScreen> {
  final Location _location = Location();
  bool isLocationServiceEnabled = false;
  PermissionStatus? _permissionStatus;

  late GoogleMapController _controller;

  Future<void> _getLocationAndLocateToNewPosition() async {
    var locationData = await _location.getLocation();
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0),
          zoom: 11.0,
        ),
      ),
    );
  }

  Future _checkPermissionGranted() async {
    print('called');
    _permissionStatus = await _location.hasPermission();

    print('_permissionStatus $_permissionStatus');
    if (_permissionStatus == PermissionStatus.denied) {
      await _location.requestPermission();

      if (_permissionStatus == PermissionStatus.denied) {
        AppSettings.openAppSettings(type: AppSettingsType.location);
      }
    } else if (_permissionStatus == PermissionStatus.deniedForever) {
      /// open app settings
      AppSettings.openAppSettings(type: AppSettingsType.location);
    } else {
      if (_permissionStatus == PermissionStatus.deniedForever) {
        AppSettings.openAppSettings(type: AppSettingsType.location);
      }
      return;
    }
  }

  Future _checkLocationStatus() async {
    isLocationServiceEnabled = await _location.serviceEnabled();
    if (!isLocationServiceEnabled) {
      await _location.requestService();
      if (!isLocationServiceEnabled) {
        _checkLocationStatus();
      }
    } else {
      return;
    }
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkLocationStatus().whenComplete(() {
      _checkPermissionGranted();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
        leading: const BackButton(),
      ),
      body: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(22.3220194, 73.0082746),
          zoom: 10,
        ),
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getLocationAndLocateToNewPosition();
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }

}
