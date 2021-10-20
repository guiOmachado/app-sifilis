import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/equipeBloc.dart';
import 'package:flutter_application_1/model/equipe.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);
  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  EquipeBloc bloc = new EquipeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
          title: Text("Equipe Trate Sífilis"),
          centerTitle: true,
        ),
        body: new ListView(
          children: [
            build_perfil(context, bloc.equipe[0].nome, bloc.equipe[0].descricao,
                bloc.equipe[0].foto),
            build_perfil(context, bloc.equipe[0].nome, bloc.equipe[0].descricao,
                bloc.equipe[0].foto),
            build_perfil(context, bloc.equipe[0].nome, bloc.equipe[0].descricao,
                bloc.equipe[0].foto),
            build_perfil(context, bloc.equipe[0].nome, bloc.equipe[0].descricao,
                bloc.equipe[0].foto)
          ],
        ));
  }

  Widget build_perfil(
      BuildContext context, String nome, String descricao, String foto) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Card(
            child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
              Container(
                color: Colors.deepPurple[100],
                height: 100,
                width: 10,
              ),
              CircleAvatar(radius: 40, backgroundImage: AssetImage(foto)),
              Expanded(
                  flex: 3,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: Text(nome),
                        subtitle: Text(descricao),
                      ),
                    ),
                  ]))
            ]))));
  }
}
