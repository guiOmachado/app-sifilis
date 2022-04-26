import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/tabs.bloc.dart';
import 'package:flutter_application_1/ui/fluxovdrl.dart';
import 'package:flutter_application_1/ui/menu.dart';
import 'package:flutter_application_1/ui/telaDeNoticias.dart';
import 'package:flutter_application_1/ui/testeRapido.dart';
import 'gestanteTesteRapido.dart';

/// This is the stateful widget that the main application instantiates.
class Tabs3 extends StatefulWidget {
  Tabs3({Key key, int index}) : super(key: key);
  @override
  _Tabs3State createState() => _Tabs3State();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Tabs3State extends State<Tabs3> {
  TabsBloc bloc = new TabsBloc();
  int _selectedIndex = 0;
  int _index = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Menu(),
    FluxoVdrl(),
    TesteRapido(),
    GestanteFluxo(),
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
    if (_selectedIndex == 0 && _index == 0) {
      _selectedIndex = 3;
      _index++;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 129, 85),
        title: Text(
          'Trate sífilis',
          textAlign: TextAlign.end,
        ),
      ),
      body: new StreamBuilder(
          stream: bloc.tabsStream,
          initialData: 3,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              _selectedIndex = snapshot.data;
              print("TESTE selected item " + _selectedIndex.toString());
              return _widgetOptions.elementAt(_selectedIndex);
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
              backgroundColor: Color.fromARGB(255, 222, 129, 85)),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: 'VDRL',
              backgroundColor: Color.fromARGB(255, 222, 129, 85)),
          BottomNavigationBarItem(
              icon: Icon(Icons.bolt),
              label: 'Teste Rápido',
              backgroundColor: Color.fromARGB(255, 222, 129, 85)),
          BottomNavigationBarItem(
              icon: Icon(Icons.pregnant_woman),
              label: 'GestanteTesteRapido',
              backgroundColor: Color.fromARGB(255, 222, 129, 85)),
        ],
        backgroundColor: Color.fromARGB(255, 222, 129, 85),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[200],
        onTap: onItemTapped,
      ),
    );
  }
}
