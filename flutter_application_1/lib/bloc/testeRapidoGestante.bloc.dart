import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/fluxo.dart';

class GestanteReagenteENaoReagenteBloc {
  StreamController fluxogramaGestante = StreamController.broadcast();

  Stream get fluxogramaGestanteStream => fluxogramaGestante.stream;

  // fluxo: id , mensagem , sim, nao
  List<Fluxo> gestante = [
    new Fluxo(1, "Paciente Mulher?", 2, 2, Colors.black),
    new Fluxo(2, "Gestante?", 3, 0, Colors.black),
    new Fluxo(
        3, "Fazer teste rápido: o Resultado é, reagente?", 6, 12, Colors.black),
    new Fluxo(4, "Reagente", 6, 3, Colors.black),
    new Fluxo(5, "Não reagente", 3, 6, Colors.black),
    new Fluxo(
        6,
        "Gestante tem úlcera anogenital ou outro sintoma de sífilis\n\n" +
            "Gestante teve parceria sexual (nos últimos 3 meses) com diagnóstico de sífilis e não foi tratado\n\n" +
            "Gestante  foi vítima de violência sexual\n\n" +
            "Gestante com história prévia de sífilis e não completou o tratamento\n" +
            "Gestante desconhece diagnóstico prévio de sífilis\n\n" +
            "Gestante com chance de perda de acompanhamento no serviço\n\n",
        7,
        11,
        Colors.pinkAccent[100]),
    new Fluxo(
        7,
        "Interpretação: SÍFILIS RECENTE (primária, secundária ou latente recente)",
        8,
        8,
        Colors.pinkAccent[100]),
    new Fluxo(
        8,
        "- Solicitar VDRL imediatamente e agendar retorno para mostrar exame.\n" +
            "- Fornecer solicitação de VDRL mensalmente até o parto. Após o parto, solicitar VDRL a cada 3 meses até que complete 12 meses de monitoramento.",
        9,
        9,
        Colors.yellow),
    new Fluxo(
        9,
        "- Notificar o caso para sífilis em gestante e encaminhar à vigilância em até 7 dias\n" +
            "- Avaliar e tratar para SÍFILIS RECENTE as parcerias sexuais dos últimos 3 meses.",
        10,
        10,
        Colors.purple),
    new Fluxo(
        10,
        "TRATAMENTO ADEQUADO É QUANDO:\n" +
            "- SÍFILIS RECENTE: VDRL atual é pelo menos 2 diluições menores que o do diagnóstico 6 meses após tratamento (Ex: anterior 1:32, atual 1:8).\n" +
            "- SÍFILIS TARDIA: VDRL atual é pelo menos 2 diluições menores que o do diagnóstico 12 meses após tratamento (Ex: anterior 1:32, atual 1:8).",
        0,
        0,
        Colors.yellow),
    new Fluxo(11, "Solicitar VDRL e aguardar resultado.", 10, 10, Colors.green),
    new Fluxo(12, "O paciente tem úlcera anogenital ou outro sintoma?", 16, 13,
        Colors.pinkAccent[100]),
    new Fluxo(
        13,
        "O paciente teve parceria sexual (nos últimos 3 meses)\ncom diagnóstico de sífilis e não foi tratado?",
        16,
        14,
        Colors.pinkAccent[100]),
    new Fluxo(14, "Interpretação: Teste NEGATIVO para sífilis", 15, 15,
        Colors.pinkAccent[100]),
    new Fluxo(
        15,
        "Orientar:\n\n - GESTANTE - repetir o teste no terceiro trimestre" +
            "(28ª semana de gestação), se já não tiver sido realizado e, no momento do parto (ou em caso de aborto/natimorto).",
        0,
        0,
        Colors.green),
    new Fluxo(
        16,
        "Interpretação: SÍFILIS RECENTE (primária, secundária ou latente recente)",
        17,
        17,
        Colors.pinkAccent[100]),
    new Fluxo(
        17,
        "Tratar imediatamente com dose única de Benzilpenicilina benzatina 2,4 milhões UI, intramuscular.\n" +
            "Se gestante/lactante tiver história préviade reação grave/anafilaxia após o uso de pencilina, encaminhar para especialista.",
        18,
        18,
        Colors.green),
    new Fluxo(
        18,
        "Solicitar VDRL imediatamente e agendar retorno para mostrar exame.",
        19,
        19,
        Colors.green),
    new Fluxo(
        18,
        "- Orientar sobre a importância de realizar um novo teste rápido para sífilis após 30 dias, devido janela imunológica.\n\n" +
            "- Fornecer solicitação de VDRL mensalmente até o parto. Após o parto, solicitar VDRL a cada 3 meses até que complete 12 meses de monitoramento.",
        19,
        19,
        Colors.yellow),
    new Fluxo(
        19,
        "- Notificar o caso para sífilis em gestante e encaminhar à vigilância em até 7 dias.\n\n"
        "- Avaliar e tratar para SÍFILIS RECENTE as parcerias sexuais dos últimos 3 meses.",
        20,
        20,
        Colors.purple),
    new Fluxo(
        20,
        "TRATAMENTO ADEQUADO É QUANDO:\n\n" +
            "- SÍFILIS RECENTE: VDRL atual é pelo menos 2 diluições menores que o do diagnóstico 6 meses após tratamento (Ex: anterior 1:32, atual 1:8).\n\n" +
            "- SÍFILIS TARDIA: VDRL atual é pelo menos 2 diluições menores que o do diagnóstico 12 meses após tratamento (Ex: anterior 1:32, atual 1:8).\n\n",
        0,
        0,
        Colors.yellow),
  ];

  resposta(int id) {
    Fluxo proximo;
    print(id);
    proximo = gestante.firstWhere((element) => element.id == id);
    print("RESPOSTA: " + proximo.questao);
    fluxogramaGestante.sink.add(proximo);
  }

  void dispose() {
    fluxogramaGestante.close();
  }
}
