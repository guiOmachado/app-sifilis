import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/testeRapidoGestante.bloc.dart';
import 'package:flutter_application_1/model/fluxo.dart';

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
                style: TextStyle(color: Colors.black)),
            backgroundColor: Color.fromARGB(1000, 236, 221, 252)),
        body: new StreamBuilder(
            stream: bloc.fluxogramaGestanteStream,
            initialData: bloc.gestante[0],
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return new ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                          child: build_card(context, snapshot.data));
                    });
              }
            }));
  }

  Widget build_card(BuildContext context, Fluxo fluxo) {
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
              ),
              Row(
                children: [
                  GestureDetector(
                    // When the child is tapped, show a snackbar.
                    onTap: () {
                      bloc.resposta(fluxo.sim);
                    },
                    // The custom button
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text('SIM'),
                    ),
                  ),
                  GestureDetector(
                    // When the child is tapped, show a snackbar.
                    onTap: () {
                      bloc.resposta(fluxo.nao);
                    },
                    // The custom button
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text('NÃO'),
                    ),
                  )
                ],
              )
            ]),
          )
        ],
      ),
    ));
  }
}
