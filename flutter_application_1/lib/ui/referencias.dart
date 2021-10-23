import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/referencias.bloc.dart';

class Referencias extends StatefulWidget {
  Referencias({Key key}) : super(key: key);

  @override
  ReferenciasState createState() => ReferenciasState();
}

class ReferenciasState extends State<Referencias> {
  @override
  ReferenciasBloc bloc = new ReferenciasBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(1000, 236, 221, 252),
          title: Text("Referências",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(500, 75, 66, 121))),
          centerTitle: true,
        ),
        body: new ListView.builder(
            itemCount: bloc.referencias.length,
            itemBuilder: (context, index) {
              return buildCard(context, bloc.referencias[index]);
            }));
  }

  Widget buildCard(BuildContext context, String referencia) {
    return GestureDetector(
        child: Card(
            child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
          Container(
            color: Color.fromARGB(500, 75, 66, 121),
            height: 100,
            width: 10,
          ),
          Expanded(
              flex: 3,
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      subtitle: Text(referencia,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6))),
                    )),
              ]))
        ]))));
  }
}
