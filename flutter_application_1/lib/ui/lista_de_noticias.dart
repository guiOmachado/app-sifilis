import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/noticias.bloc.dart';

class ListaDeNoticias extends StatefulWidget {
  ListaDeNoticias({Key key}) : super(key: key);

  @override
  ListaDeNoticiasState createState() => ListaDeNoticiasState();
}

class ListaDeNoticiasState extends State<ListaDeNoticias> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Notícias", style: TextStyle(color: Colors.black)),
            backgroundColor: Color.fromARGB(1000, 236, 221, 252)),
        body: new StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('noticias').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                List<QueryDocumentSnapshot> docs = snapshot.data.docs;
                return new ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child:
                              build_card(context, docs[index].data().values));
                    });
              }
            }));
  }

  Widget build_card(BuildContext context, Iterable<dynamic> dadosNoticias) {
    return Card(
        child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Expanded(flex: 1, child: new Image.asset('icone.PNG')),
          ),
          Expanded(
            flex: 3,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  title: Text(dadosNoticias.elementAt(1),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(500, 75, 66, 121))),
                  subtitle: Text(
                    dadosNoticias.elementAt(0),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(500, 75, 66, 121)),
                  ),
                ),
              ),
              FlatButton(
                textColor: Colors.blue,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  print("clicado");
                },
                child: Text(
                  "Ler mais ->",
                  style: TextStyle(fontSize: 15.0),
                ),
              )
            ]),
          )
        ],
      ),
    ));
  }
}
