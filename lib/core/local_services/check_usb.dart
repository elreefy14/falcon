import 'package:flutter/services.dart';

class UsbConnectionChecker {
  static const platform = MethodChannel('com.falcon_elearning_2024.falcon/usb');

  Future<bool> isUsbConnected() async {
    try {
      final bool isUsbConnected = await platform.invokeMethod('checkUsbConnection');
      return isUsbConnected;
    } on PlatformException catch (e) {
      return false;
    }
  }
}