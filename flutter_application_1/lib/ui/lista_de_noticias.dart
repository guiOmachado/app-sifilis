import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/noticias.bloc.dart';

class ListaDeNoticias extends StatefulWidget {
  ListaDeNoticias({Key key}) : super(key: key);

  @override
  ListaDeNoticiasState createState() => ListaDeNoticiasState();
}

class ListaDeNoticiasState extends State<ListaDeNoticias> {
  NoticiasBloc bloc = new NoticiasBloc();

  @override
  Widget build(BuildContext context) {
    bloc.getNotice();
    return Scaffold(
        appBar: AppBar(
          title: Text('Tela de noticias'),
        ),
        body: StreamBuilder(
          stream: bloc.noticeStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              CircularProgressIndicator();
            }
            return ListView.builder(itemBuilder: (BuildContext context, int i) {
              //var item = ;

              return ListTile(
                  //title: Text(item['titulo']),
                  );
            });
          },
        ));
  }
}
