import 'package:flutter/material.dart';

class PeoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('People'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 121, 215, 148),
        ),
      );
}
