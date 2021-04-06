import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/ui/bottonTabs.dart';
import 'package:flutter_application_1/ui/splashScreen.dart';
import 'package:sizer/sizer_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SplashScreenPage());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Tabs(),
            );
          },
        );
      },
    );
  }
}
