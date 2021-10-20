import 'dart:async';

import 'package:flutter_application_1/model/equipe.dart';

class EquipeBloc {
  StreamController equipeBloc = StreamController.broadcast();

  Stream get equipeStream => equipeBloc.stream;

  List<Equipe> equipe = [
    Equipe("Guilherme", "Graduando em informática biiomédica",
        "assets/fotos/foto_guilherme.jpeg")
  ];

  void dispose() {
    equipeBloc.close();
  }
}
