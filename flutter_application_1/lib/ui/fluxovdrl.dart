import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/conducaovdrl.bloc.dart';
import 'package:flutter_application_1/model/fluxo.dart';
import 'package:sizer/sizer.dart';

class FluxoVdrl extends StatefulWidget {
  FluxoVdrl({Key key}) : super(key: key);

  @override
  FluxoVdrlState createState() => FluxoVdrlState();
}

class FluxoVdrlState extends State<FluxoVdrl> {
  FluxoVdrlBloc bloc = new FluxoVdrlBloc();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("CONDUÇÃO DE VDRL",
                style: TextStyle(fontSize: 18, color: Colors.black)),
            backgroundColor: Color.fromARGB(1000, 236, 221, 252)),
        body: new StreamBuilder(
            stream: bloc.fluxogramaStream,
            initialData: bloc.fluxo[0],
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

  Widget build_Questao_Fluxo(BuildContext context, Fluxo fluxo) {
    return Card(
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
          Expanded(
              flex: 3,
              child: Column(children: [
                Container(
                  color: fluxo.cor,
                  height: 10,
                ),
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
