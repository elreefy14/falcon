import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    self.window.secureApp()
    GeneratedPluginRegistrant.register(with: self)

    // Set up the MethodChannel for USB connection check
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let usbChannel = FlutterMethodChannel(name: "com.falcon_elearning_2024.falcon/usb",
                                          binaryMessenger: controller.binaryMessenger)

    usbChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "checkUsbConnection" {
        let isUsbConnected = self.checkUsbConnection() // Use the method below to handle USB check
        result(isUsbConnected)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Sample method to check USB connection (this is a placeholder for now)
  private func checkUsbConnection() -> Bool {
    // iOS doesn't have direct APIs to check USB, return false for now or implement custom logic
    return false
  }
}

extension UIWindow {
  func secureApp() {
    let field = UITextField()
    field.isSecureTextEntry = true
    self.addSubview(field)
    field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    self.layer.superlayer?.addSublayer(field.layer)
    field.layer.sublayers?.first?.addSublayer(self.layer)
  }
}
