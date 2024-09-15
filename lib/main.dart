import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:falcon/core/core_exports.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() async {
  ServicesLocator().init();


  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) =>
  //         BlocProvider(
  //           create: (context) => TimerBloc(),
  //           child: MyApp(),
  //         ), // Wrap your app
  //   ),);

  runApp(
    BlocProvider(
      create: (context) => TimerBloc(),
      child: MyApp(),
    )
    ,);


  WidgetsBinding.instance.addPostFrameCallback((timeStamp)async{
    if(Platform.isAndroid){
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
}