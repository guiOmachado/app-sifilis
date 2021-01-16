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
            title: Text("App Sifilis"),
            backgroundColor: Color.fromARGB(500, 75, 66, 121)),
        body: new StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('noticias').snapshots(),
            builder: (context, snapshot) {
              List<QueryDocumentSnapshot> docs = snapshot.data.docs;
              print("TESTE DADOS");
              docs.forEach((element) {
                print(element.data());
                //notice.add(element.data());
              });

              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return new ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return build_card(context, docs[index].data().values);
                    });
              }
            }));
  }

  Widget build_card(BuildContext context, Iterable<dynamic> dadosNoticias) {
    return Card(
      //clipBehavior: Clip.antiAlias,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            height: 50.0,
            width: 50.0,
            margin: new EdgeInsets.only(left: 46.0),
            child: FlutterLogo(),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(dadosNoticias.elementAt(1)),
              subtitle: Text(
                dadosNoticias.elementAt(0),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
