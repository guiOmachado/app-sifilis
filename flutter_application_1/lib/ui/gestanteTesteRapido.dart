import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/testeRapidoGestante.bloc.dart';
import 'package:flutter_application_1/model/fluxo.dart';
import 'package:flutter_application_1/ui/testeRapido.dart';
import 'package:sizer/sizer.dart';

class GestanteFluxo extends StatefulWidget {
  GestanteFluxo({Key key}) : super(key: key);

  @override
  GestanteFluxoState createState() => GestanteFluxoState();
}

class GestanteFluxoState extends State<GestanteFluxo> {
  GestanteReagenteENaoReagenteBloc bloc =
      new GestanteReagenteENaoReagenteBloc();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("GESTANTE-CONDUÇÃO DE TESTE RÁPIDO",
                style: TextStyle(fontSize: 18, color: Colors.black)),
            backgroundColor: Color.fromARGB(1000, 236, 221, 252)),
        body: new StreamBuilder(
            stream: bloc.fluxogramaGestanteStream,
            initialData: bloc.gestante[0],
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
                  if (fluxo.nao == 0) {
                    _showMyDialog();
                  } else {
                    bloc.resposta(fluxo.nao);
                  }
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Este não é o fluxo indicado para a situação.'),
                Text('Você será direcionado para o fluxo correto.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TesteRapido()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
