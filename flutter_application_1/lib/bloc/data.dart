import 'dart:async';

import 'package:flutter_application_1/model/fluxo.dart';

class FluxoBloc {
  StreamController fluxograma = StreamController.broadcast();

  Stream get noticeStream => fluxograma.stream;

  // ignore: non_constant_identifier_names
  List<Fluxo> fluxo = [
    new Fluxo(1, "TESTE DE FLUXO 1", 2, 3),
    new Fluxo(2, "TESTE DE FLUXO 2", 3, 1),
    new Fluxo(3, "TESTE DE FLUXO 3", 2, 1)
  ];

  resposta(int id) {
    Fluxo proximo;
    print(id);
    proximo = fluxo.firstWhere((element) => element.id == id);
    print("RESPOSTA: " + proximo.questao);
    //fluxograma.sink.add(proximo);
  }

  void dispose() {
    fluxograma.close();
  }
}
