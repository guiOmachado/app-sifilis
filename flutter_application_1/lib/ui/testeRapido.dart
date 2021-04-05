import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/conducaoDeTesteRapido.bloc.dart';
import 'package:flutter_application_1/model/fluxo.dart';
import 'package:sizer/sizer.dart';

class TesteRapido extends StatefulWidget {
  TesteRapido({Key key}) : super(key: key);

  @override
  TesteRapidoState createState() => TesteRapidoState();
}

class TesteRapidoState extends State<TesteRapido> {
  ConducaoDeTesteRapidoBloc bloc = new ConducaoDeTesteRapidoBloc();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("TESTE RAPIDO",
                style: TextStyle(fontSize: 18, color: Colors.black)),
            backgroundColor: Color.fromARGB(1000, 236, 221, 252)),
        body: new StreamBuilder(
            stream: bloc.fluxoTesteRapidoStream,
            initialData: bloc.testeRapido[0],
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return Container(
                    alignment: Alignment.center,
                    width: 100.0.w,
                    height: 90.0.h,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              alignment: Alignment.topCenter,
                              width: 100.0.w,
                              child:
                                  build_Questao_Fluxo(context, snapshot.data)),
                          Container(
                              alignment: Alignment.bottomCenter,
                              child:
                                  build_Buttons_Fluxo(context, snapshot.data)),
                        ]));
              }
            }));
  }

  Widget build_Buttons_Fluxo(BuildContext context, Fluxo fluxo) {
    if ((fluxo.nao == fluxo.sim) && (fluxo.nao != 0 && fluxo.sim != 0)) {
      return RaisedButton(
          onPressed: () {
            bloc.resposta(fluxo.sim);
          },
          autofocus: false,
          color: Color.fromARGB(1000, 236, 221, 252),
          child: Text("Próximo"));
    } else if ((fluxo.nao == fluxo.sim) && (fluxo.nao == 0 && fluxo.sim == 0)) {
      return RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          autofocus: false,
          color: Color.fromARGB(1000, 236, 221, 252),
          child: Text("Fim"));
    } else {
      return Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                  onPressed: () {
                    bloc.resposta(fluxo.sim);
                  },
                  autofocus: false,
                  color: Color.fromARGB(1000, 236, 221, 252),
                  child: Text("Sim")),
              RaisedButton(
                  onPressed: () {
                    bloc.resposta(fluxo.nao);
                  },
                  autofocus: false,
                  color: Color.fromARGB(1000, 236, 221, 252),
                  child: Text("Não"))
            ],
          ));
    }
  }

  Widget build_Questao_Fluxo(BuildContext context, Fluxo fluxo) {
    return Card(
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
          Container(
            color: Colors.cyan[300],
            height: 100,
            width: 10,
          ),
          Expanded(
              flex: 3,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(fluxo.questao,
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
