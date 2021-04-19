import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaDeNoticias extends StatefulWidget {
  ListaDeNoticias({Key key}) : super(key: key);

  @override
  ListaDeNoticiasState createState() => ListaDeNoticiasState();
}

class ListaDeNoticiasState extends State<ListaDeNoticias> {
  //NoticiasBloc bloc = new NoticiasBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Noticias",
                style: TextStyle(fontSize: 18, color: Colors.black)),
            backgroundColor: Color.fromARGB(1000, 236, 221, 252)),
        body: new StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('noticias').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                List<QueryDocumentSnapshot> docs = snapshot.data.docs;
                print("TESTE DADOS");
                docs.forEach((element) {
                  print(element.data());
                  //notice.add(element.data());
                });
                return new ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return build_card(context, docs[index].data().values);
                    });
              }
            }));
  }

  Widget build_card(BuildContext context, Iterable<dynamic> dadosNoticias) {
    return GestureDetector(
        onTap: () {
          /*Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return _widgetOptions.elementAt(index);
          }));*/
          print("VAI PARA UM LINK");
        },
        child: Card(
            child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
              Container(
                child: FlutterLogo(),
                color: Colors.red,
                height: 100,
                width: 10,
              ),
              Expanded(
                  flex: 3,
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          title: Text(dadosNoticias.elementAt(1)),
                          subtitle: Text(dadosNoticias.elementAt(0),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6))),
                        )),
                  ]))
            ]))));
  }
}
