import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/fluxovdrl.dart';
import 'package:flutter_application_1/ui/identificacao.dart';
import 'package:flutter_application_1/ui/monitoramento.dart';
import 'package:flutter_application_1/ui/registro.dart';

import 'gestanteTesteRapido.dart';

/// This is the stateful widget that the main application instantiates.
class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Tabs> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    FluxoVdrl(),
    Identificacao(),
    GestanteFluxo(),
    Monitoramento(),
    Registro(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(500, 75, 66, 121),
        title: Text('App Name'),
      ),
      drawer: build_side_menu(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: 'VDRL',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_search),
              label: 'outracoisa',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant),
              label: 'GestanteTesteRapido',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor),
              label: 'Monitoramento',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Registro',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[200],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget build_side_menu(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "MENU",
                    style: TextStyle(color: Colors.white),
                  )),
              height: 50,
              width: 100,
              color: Color.fromARGB(500, 75, 66, 121)),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Condução de VDRL",
                        style: TextStyle(color: Colors.white),
                      )),
                  height: 50,
                  width: 100,
                  color: Color.fromARGB(500, 75, 66, 121))),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Teste Rápido Gestante",
                        style: TextStyle(color: Colors.white),
                      )),
                  height: 50,
                  width: 100,
                  color: Color.fromARGB(500, 75, 66, 121))),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "MONITORAMENTO",
                        style: TextStyle(color: Colors.white),
                      )),
                  height: 50,
                  width: 100,
                  color: Color.fromARGB(500, 75, 66, 121))),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "REGISTRO",
                        style: TextStyle(color: Colors.white),
                      )),
                  height: 50,
                  width: 100,
                  color: Color.fromARGB(500, 75, 66, 121)))
        ],
      ),
    );
  }
}
