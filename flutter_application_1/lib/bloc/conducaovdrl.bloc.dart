import 'dart:async';

import 'package:flutter_application_1/model/fluxo.dart';

class FluxoVdrlBloc {
  StreamController fluxograma = StreamController.broadcast();

  Stream get fluxogramaStream => fluxograma.stream;

  // fluxo: id , mensagem , sim, nao
  List<Fluxo> fluxo = [
    new Fluxo(1, "VDRL Reagente ?", 2, 2),
    new Fluxo(
        2,
        "Paciente tem história e/ou registro de tratamento prévio para sífilis?",
        4,
        3),
    new Fluxo(
        3,
        "O paciente tem úlcera anogenital ou outro sintoma de sífilis secundária?",
        8,
        9),
    new Fluxo(
        4, "Paciente tem VDRL após tratamento prévio para comparar?", 5, 3),
    new Fluxo(
        5,
        "VDRL atual tem titulação pelo menos 2 diluições maior que o último VDRL realizado após tratamento prévio adequado para sífilis?Exemplo: VDRL atual 1:16 e anterior 1:4.",
        3,
        6),
    new Fluxo(
        6,
        "O paciente tem úlcera anogenital ou outro sintoma de sífilis secundária?",
        8,
        7),
    new Fluxo(7, "Cicatriz sorológica", 0, 0),
    new Fluxo(
        8,
        "Se ainda não tratado, tratar para SÍFILIS RECENTE (primária, secundária ou latente recente) com dose única de Benzilpenicilina benzatina 2,4 milhões UI, intramuscular.",
        11,
        11),
    new Fluxo(
        9,
        "Tratar para SÍFILIS TARDIA com Benzilpenicilina benzatina 2,4 milhões UI, intramuscular, 1 vez por semana, por 3 semanas. Dose total: 7,2 milhões UI.O intervalo entre as doses deve ser de 7 dias. No entanto, caso ultrapasse 14 dias, o esquema deverá ser reiniciado",
        11,
        11),
    new Fluxo(
        10,
        "TRATAMENTO ADEQUADO É QUANDO:- SÍFILIS RECENTE: VDRL atual é pelo menos 2 diluições menores que o do diagnóstico 6 meses após tratamento (Ex: anterior 1:32, atual 1:8).- SÍFILIS TARDIA: VDRL atual é pelo menos 2 diluições menores que o do diagnóstico 12 meses após tratamento (Ex: anterior 1:32, atual 1:8).",
        0,
        0),
    new Fluxo(
        11,
        " - notificar o caso para sífilis adquirida e encaminhar à vigilância em até 7 dias;- Fornecer solicitação de VDRL para após 3 meses, 6 meses, 9 meses e 12 meses para monitoramento.- avaliar e tratar para SÍFILIS RECENTE as parcerias sexuais dos últimos 3 meses.",
        10,
        10),
  ];

  resposta(int id) {
    Fluxo proximo;
    print(id);
    proximo = fluxo.firstWhere((element) => element.id == id);
    print("RESPOSTA: " + proximo.questao);
    fluxograma.sink.add(proximo);
  }

  void dispose() {
    fluxograma.close();
  }
}
