import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/bottonTabs.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenWidget(),
    );
  }
}

class SplashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: Color.fromARGB(1000, 236, 221, 252),
          navigateAfterSeconds: MyApp(),
          loaderColor: Colors.transparent,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/splashscreen/logo.png"),
                        fit: BoxFit.contain)),
              ),
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: FlareActor(
                  "assets/splashscreen/loading.flr",
                  animation: "loading",
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
