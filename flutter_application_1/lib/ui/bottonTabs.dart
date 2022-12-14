import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/tabs.bloc.dart';

import 'package:flutter_application_1/ui/fluxovdrl.dart';
import 'package:flutter_application_1/ui/menu.dart';
import 'package:flutter_application_1/ui/telaDeNoticias.dart';
import 'package:flutter_application_1/ui/testeRapido.dart';
import 'gestanteTesteRapido.dart';

/// This is the stateful widget that the main application instantiates.
class Tabs extends StatefulWidget {
  Tabs({Key key, int index}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TabsState extends State<Tabs> {
  TabsBloc bloc = new TabsBloc();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Menu(),
    TesteRapido(),
    GestanteFluxo(),
    FluxoVdrl(),
    ListaDeNoticias()
  ];

  void onItemTapped(int index) {
    setState(() {
      bloc.getFluxo(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 66, 121),
        title: Text(
          'Trate sífilis',
          textAlign: TextAlign.end,
        ),
      ),
      body: new StreamBuilder(
          stream: bloc.tabsStream,
          initialData: 0,
          builder: (context, snapshot) {
            print("TESTE TROCA " + snapshot.data.toString());
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              _selectedIndex = snapshot.data;
              return _widgetOptions.elementAt(_selectedIndex);
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_open),
              label: 'Menu',
              backgroundColor: Color.fromARGB(255, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.flash_on),
              label: 'Teste Rápido',
              backgroundColor: Color.fromARGB(255, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.family_restroom),
              label: 'GestanteTesteRapido',
              backgroundColor: Color.fromARGB(255, 75, 66, 121)),
          BottomNavigationBarItem(
              icon: Icon(Icons.enhanced_encryption_sharp),
              label: 'VDRL',
              backgroundColor: Color.fromARGB(255, 75, 66, 121)),
        ],
        backgroundColor: Color.fromARGB(255, 75, 66, 121),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[200],
        onTap: onItemTapped,
      ),
    );
  }
}
