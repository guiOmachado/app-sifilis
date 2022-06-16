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
          backgroundColor: Color.fromARGB(255, 121, 215, 148),
          title: Text("Referências",
              style: TextStyle(
                  fontFamily: 'Overlock-Regular',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
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
            color: Color.fromARGB(255, 121, 215, 148),
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
                              TextStyle(fontFamily: 'Overlock-Regular', color: Colors.black.withOpacity(0.6))),
                    )),
              ]))
        ]))));
  }
}
