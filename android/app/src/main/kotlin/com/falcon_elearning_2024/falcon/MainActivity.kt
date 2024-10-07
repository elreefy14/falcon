package com.falcon_elearning_2024.falcon

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.falcon_elearning_2024.falcon/usb"

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "checkUsbConnection") {
                val isUsbConnected = checkUsbConnection()
                result.success(isUsbConnected)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun checkUsbConnection(): Boolean {
        // Register a receiver to detect USB state
        val intentFilter = IntentFilter("android.hardware.usb.action.USB_STATE")
        val usbStatus: Intent? = applicationContext.registerReceiver(null, intentFilter)

        // Check if the device is connected via USB
        val isConnected = usbStatus?.getBooleanExtra("connected", false) ?: false
        return isConnected
    }
}



//package com.falcon_elearning_2024.falcon
//
//import android.os.Bundle
//import android.provider.Settings
//import io.flutter.embedding.android.FlutterActivity
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugin.common.MethodChannel
//
//class MainActivity : FlutterActivity() {
//    private val CHANNEL = "adb"
//
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//            if (call.method == "checkingadb") {
//                checkingadb(result)
//            } else {
//                result.notImplemented()
//            }
//        }
//    }
//
//    private fun checkingadb(result: MethodChannel.Result) {
//        val adbEnabled = Settings.Secure.getInt(
//            contentResolver,
//            Settings.Secure.ADB_ENABLED, 0
//        ) == 1
//        result.success(if (adbEnabled) 1 else 0)
//    }
//}
