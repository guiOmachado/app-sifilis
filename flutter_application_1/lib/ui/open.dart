import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'bottonTabs.dart';

class Open extends StatefulWidget {
  Open({Key key, int index}) : super(key: key);
  @override
  OpenState createState() => OpenState();
}

class OpenState extends State<Open> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 181, 143, 200),
          Color.fromARGB(255, 222, 129, 85),
          Color.fromARGB(255, 142, 197, 231),
          Color.fromARGB(255, 121, 215, 148),
          Color.fromARGB(255, 247, 250, 138)
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/imag-app2.jpeg',
                height: 30.0.h,
                width: 70.0.w,
              ),
            ),
          ]),
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Trate Sífilis',
                  style: TextStyle(
                     fontFamily: 'Overlock-Regular', fontSize: 25, color: Color.fromARGB(500, 75, 66, 121)))),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    color: Color.fromARGB(500, 75, 66, 121),
                    child: Text('Entrar',
                        style: TextStyle( 
                            fontFamily: 'Overlock-Regular',
                            fontSize: 20,
                            color: Color.fromARGB(1000, 236, 221, 252))),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Tabs();
                        }),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
