import 'package:flutter/services.dart';

class UsbConnectionChecker {
  static const platform = MethodChannel('com.falcon_elearning_2024.falcon/usb');

  Future<bool> isUsbConnected() async {
    try {
      final bool isUsbConnected = await platform.invokeMethod('checkUsbConnection');
      print("latform.invokeMethod : $isUsbConnected");
      return isUsbConnected;
    } on PlatformException catch (e) {
      print("Failed to check USB connection: ${e.message}");
      return false;
    }
  }
}