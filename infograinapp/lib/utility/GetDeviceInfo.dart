import 'package:connectivity/connectivity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class GetDeviceInfo {
  Future<Map<String, dynamic>> getDeviceInfo(email, otp) async {
    // Device Info
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // Location location = new Location();
    var uuid = Uuid();
    String deviceName;
    String deviceType;
    String deviceToken = uuid.v4();
    // Replace with actual method to get device token
    String ipAddress;

    // Get Device Name and Type
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model;
      deviceType = "Android";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.utsname.machine;
      deviceType = "iOS";
    } else {
      deviceName = "Unknown";
      deviceType = "Unknown";
    }

    // Get IP Address
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final response =
          await http.get(Uri.parse('https://api64.ipify.org?format=json'));
      if (response.statusCode == 200) {
        ipAddress = jsonDecode(response.body)['ip'];
      } else {
        ipAddress = 'Failed to get IP Address';
      }
    } else {
      ipAddress = 'No internet connection';
    }

    // Get Location
    // bool _serviceEnabled;
    // PermissionStatus _permissionGranted;
    // LocationData _locationData;

    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     return {
    //       'deviceToken': deviceToken,
    //       'deviceType': deviceType,
    //       'deviceName': deviceName,
    //       'IpAdderss': ipAddress,
    //       'latitude': 'Service not enabled',
    //       'longitude': 'Service not enabled',
    //     };
    //   }
    // }

    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     return {
    //       'deviceToken': deviceToken,
    //       'deviceType': deviceType,
    //       'deviceName': deviceName,
    //       'IpAdderss': ipAddress,
    //       'latitude': 'Permission denied',
    //       'longitude': 'Permission denied',
    //     };
    //   }
    // }

    // _locationData = await location.getLocation();

    return {
      'deviceToken': deviceToken,
      'deviceType': deviceType,
      'deviceName': deviceName,
      'IpAdderss': ipAddress,
      'latitude': "22.719568",
      'longitude': "75.857727",
      'email': email,
      'otp': otp
    };
  }
}
