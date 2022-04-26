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
          backgroundColor: Color.fromARGB(255, 222, 129, 85),
          title: Text("Equipe Trate Sífilis"),
          centerTitle: true,
        ),
        body: new ListView(
          children: [
            build_perfil(context, bloc.equipe[0].nome, bloc.equipe[0].descricao,
                bloc.equipe[0].foto),
            build_perfil(context, bloc.equipe[1].nome, bloc.equipe[1].descricao,
                bloc.equipe[1].foto),
            build_perfil(context, bloc.equipe[2].nome, bloc.equipe[2].descricao,
                bloc.equipe[2].foto),
            build_perfil(context, bloc.equipe[3].nome, bloc.equipe[3].descricao,
                bloc.equipe[3].foto),
            build_perfil(context, bloc.equipe[4].nome, bloc.equipe[4].descricao,
                bloc.equipe[4].foto),
                build_perfil(context, bloc.equipe[5].nome, bloc.equipe[5].descricao,
                bloc.equipe[5].foto),
            build_perfil(context, bloc.equipe[6].nome, bloc.equipe[6].descricao,
                bloc.equipe[6].foto)
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
