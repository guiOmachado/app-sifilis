import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/assistencia.dart';
import 'package:flutter_application_1/ui/identificacao.dart';
import 'package:flutter_application_1/ui/lista_de_noticias.dart';
import 'package:flutter_application_1/ui/monitoramento.dart';
import 'package:flutter_application_1/ui/registro.dart';

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
    ListaDeNoticias(),
    Identificacao(),
    Assistencia(),
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
        title: Text('App Sifilis'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: 'Notícias',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_search),
              label: 'Identificação',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant),
              label: 'Assistência',
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
}
