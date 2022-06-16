import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/conducaoDeTesteRapido.bloc.dart';
import 'package:flutter_application_1/model/fluxo.dart';
import 'package:flutter_application_1/ui/bottonTabs.dart';
import 'package:flutter_application_1/ui/bottonTabs3.dart';
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
            title: Text("Teste Rápido",
                style: TextStyle(fontFamily: 'Overlock-Regular', fontSize: 15, color: Colors.black)),
            backgroundColor: Color.fromARGB(255, 247, 250, 138)),
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
          color: Color.fromARGB(255, 247, 250, 138),
          child: Text("Próximo",
              style: TextStyle(fontFamily: 'Overlock-Regular', color: Color.fromARGB(500, 75, 66, 121))));
    } else if ((fluxo.nao == fluxo.sim) && (fluxo.nao == 0 && fluxo.sim == 0)) {
      return RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Tabs();
            }));
          },
          autofocus: false,
          color: Color.fromARGB(255, 247, 250, 138),
          child: Text("Fim",
              style: TextStyle(fontFamily: 'Overlock-Regular', color: Color.fromARGB(500, 75, 66, 121))));
    } else {
      return Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                  onPressed: () {
                    if (fluxo.sim == 0) {
                      _showMyDialog();
                    } else {
                      bloc.resposta(fluxo.sim);
                    }
                  },
                  autofocus: false,
                  color: Color.fromARGB(255, 247, 250, 138),
                  child: Text("Sim",
                      style:
                          TextStyle(fontFamily: 'Overlock-Regular', color: Color.fromARGB(500, 75, 66, 121)))),
              RaisedButton(
                  onPressed: () {
                    bloc.resposta(fluxo.nao);
                  },
                  autofocus: false,
                  color: Color.fromARGB(255, 247, 250, 138),
                  child: Text("Não",
                      style:
                          TextStyle(fontFamily: 'Overlock-Regular', color: Color.fromARGB(500, 75, 66, 121)))),
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
                            fontSize: 13,
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
            title: Text(
              'Opa . . .',
              style: TextStyle(
                  fontFamily: 'Overlock-Regular', fontSize: 25, color: Color.fromARGB(500, 75, 66, 121)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Este não é o fluxo indicado para a situação, você será direcionado para o fluxo correto.',
                      style: TextStyle(fontFamily: 'Overlock-Regular', fontSize: 18))
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                  color: Color.fromARGB(255, 247, 250, 138),
                  child: Text('OK',
                      style: TextStyle(
                          fontFamily: 'Overlock-Regular',
                          fontSize: 20,
                          color: Color.fromARGB(500, 75, 66, 121))),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Tabs3();
                      }),
                    );
                  }),
            ],
            elevation: 25);
      },
    );
  }
}
