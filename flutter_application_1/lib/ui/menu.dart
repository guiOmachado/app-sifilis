import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/conducaovdrl.bloc.dart';
import 'package:sizer/sizer.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  FluxoVdrlBloc bloc = new FluxoVdrlBloc();
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
    return Card(
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
          Container(
            color: Colors.amber,
            height: 100,
            width: 10,
          ),
          Expanded(
              flex: 3,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text("TESTE",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(500, 75, 66, 121))),
                  ),
                )
              ]))
        ])));
  }
}
