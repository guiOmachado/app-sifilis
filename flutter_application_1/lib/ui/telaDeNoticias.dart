import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            title: Text("Notícias",
                style: TextStyle(fontSize: 15, color: Colors.black)),
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
          launchURL(dadosNoticias.elementAt(0));
        },
        child: Card(
            child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
              Container(
                color: Colors.amber,
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
                          subtitle: Text(dadosNoticias.elementAt(2),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6))),
                        )),
                  ]))
            ]))));
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
