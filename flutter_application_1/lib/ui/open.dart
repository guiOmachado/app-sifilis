import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          backgroundColor: Color.fromARGB(500, 75, 66, 121),
          title: Text(
            'Trate sífilis',
            textAlign: TextAlign.end,
          ),
        ),
        body: Container(
          child: RaisedButton(
              color: Color.fromARGB(1000, 236, 221, 252),
              child: Text('OK',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(500, 75, 66, 121))),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Tabs();
                  }),
                );
              }),
        ));
  }
}
