import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/lista_de_noticias.dart';

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
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 4: School',
      style: optionStyle,
    ),
    Text(
      'Index 5: School',
      style: optionStyle,
    ),
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
              icon: Icon(Icons.home),
              label: 'Notícias',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Identificação',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Assistência',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Monitoramento',
              backgroundColor: Color.fromARGB(500, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
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
