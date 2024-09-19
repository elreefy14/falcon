import 'package:flutter/services.dart';

class UsbService {
  static const platform = MethodChannel('falcon_elearning_2024.falcon.usbconnection/usb');

  static Future<bool> isUsbConnected() async {
    try {
      final bool result = await platform.invokeMethod('isUsbConnected');
      return result;
    } catch (e) {
      print('Error checking USB connection: $e');
      print('-----------------------------------------------------------------');
      return false;
    }
  }
}
