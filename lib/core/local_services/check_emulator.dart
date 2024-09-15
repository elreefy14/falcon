import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

Future<bool> isRunningOnEmulator() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    // Check if device is an emulator
    return androidInfo.isPhysicalDevice == false;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    // Check if device is an emulator
    return iosInfo.isPhysicalDevice == false;
  } else {
    // For other platforms, return false (assume they are real devices)
    return false;
  }
}