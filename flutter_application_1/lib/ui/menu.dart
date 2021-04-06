import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/conducaovdrl.bloc.dart';
import 'package:flutter_application_1/ui/bottonTabs.dart';
import 'package:flutter_application_1/ui/bottonTabs1.dart';
import 'package:flutter_application_1/ui/bottonTabs2.dart';
import 'package:flutter_application_1/ui/bottonTabs3.dart';
import 'package:sizer/sizer.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  FluxoVdrlBloc bloc = new FluxoVdrlBloc();

  List<Widget> _widgetOptions = <Widget>[
    Tabs(),
    Tabs1(),
    Tabs2(),
    Tabs3(),
  ];

  List<Widget> _icons = <Widget>[
    Image.asset(
      'assets/images/vdrl.png',
      height: 100,
      width: 100,
    ),
    Image.asset(
      'assets/images/vdrl.png',
      height: 100,
      width: 100,
    ),
    Image.asset(
      'assets/images/testeRapido.jpg',
      height: 100,
      width: 100,
    ),
    Image.asset(
      'assets/images/gestante.jpg',
      height: 100,
      width: 100,
    ),
  ];

  List<Widget> _titles = <Widget>[
    Text("Posição nao usada"),
    Text("Condução de VDRL",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(500, 75, 66, 121))),
    Text("Condução de teste rápido",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(500, 75, 66, 121))),
    Text("Gestante- Condução de teste rápido",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(500, 75, 66, 121)))
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("MENU",
                style: TextStyle(fontSize: 18, color: Colors.black)),
            backgroundColor: Color.fromARGB(1000, 236, 221, 252)),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            build_selecao(context, 1),
            build_selecao(context, 2),
            build_selecao(context, 3)
          ],
        ));
  }

  Widget build_selecao(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return _widgetOptions.elementAt(index);
          }));
        },
        child: Card(
            child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
              Container(
                color: Colors.red,
                height: 100,
                width: 10,
              ),
              _icons.elementAt(index),
              Expanded(
                  flex: 3,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: _titles.elementAt(index),
                      ),
                    ),
                  ]))
            ]))));
  }
}
