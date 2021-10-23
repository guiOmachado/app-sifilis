import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/conducaovdrl.bloc.dart';
import 'package:flutter_application_1/ui/bottonTabs.dart';
import 'package:flutter_application_1/ui/bottonTabs1.dart';
import 'package:flutter_application_1/ui/bottonTabs2.dart';
import 'package:flutter_application_1/ui/bottonTabs3.dart';
import 'package:flutter_application_1/ui/bottonTabs4.dart';
import 'package:flutter_application_1/ui/navDrawer.dart';

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
    Tabs4()
  ];

  List<Widget> _icons = <Widget>[
    Image.asset(
      'assets/images/noticias.png',
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
    Image.asset(
      'assets/images/noticias.png',
      height: 100,
      width: 100,
    )
  ];

  List<Widget> _titles = <Widget>[
    Text("Posição nao usada"),
    Text("Condução de VDRL",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54)),
    Text("Condução de teste rápido",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54)),
    Text("Gestante- Condução de teste rápido",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54)),
    Text("Notícias",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54))
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Menu",
                style: TextStyle(fontSize: 15, color: Colors.black)),
            backgroundColor: Color.fromARGB(1000, 236, 221, 252)),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            build_selecao(context, 2, Color.fromARGB(255, 181, 143, 200)),
            build_selecao(context, 3, Color.fromARGB(255, 222, 129, 85)),
            build_selecao(context, 1, Color.fromARGB(255, 121, 215, 148)),
            build_selecao(context, 4, Color.fromARGB(255, 247, 250, 138))
          ],
        ),
        drawer: NavDrawer());
  }

  Widget build_selecao(BuildContext context, int index, Color cor) {
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
                color: cor,
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
