import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/fluxo.dart';

class ConducaoDeTesteRapidoBloc {
  StreamController fluxoTesteRapido = StreamController.broadcast();

  Stream get fluxoTesteRapidoStream => fluxoTesteRapido.stream;

  // fluxo: id , mensagem , sim, nao, cor
  List<Fluxo> testeRapido = [
    new Fluxo(1, "Paciente Mulher?", 2, 3, Colors.black),
    new Fluxo(2, "Gestante?", 0, 3, Colors.black),
    new Fluxo(
        3, "Fazer teste rápido: o Resultado é, reagente?", 6, 12, Colors.black),
    new Fluxo(4, "Reagente", 6, 3, Colors.black),
    new Fluxo(5, "Não reagente", 3, 6, Colors.black),
    new Fluxo(
        6,
        "O Paciente tem úlcera anogenital ou outro sintoma de sífilis\n\n",
        7,
        21,
        Colors.orange[800]),
    new Fluxo(
        21,
        "Paciente teve parceria sexual (nos últimos 3 meses) com diagnóstico de sífilis e não foi tratado\n\n",
        7,
        22,
        Colors.orange[800]),
    new Fluxo(
        22,
        "Paciente com chance de perda de acompanhamento no serviço\n\n",
        7,
        23,
        Colors.orange[800]),
    new Fluxo(23, "Paciente  foi vítima de violência sexual\n\n", 7, 24,
        Colors.orange[800]),
    new Fluxo(
        24,
        "Paciente com história prévia de sífilis e não completou o tratamento\n",
        7,
        25,
        Colors.orange[800]),
    new Fluxo(25, "Paciente desconhece diagnóstico prévio de sífilis\n\n", 7,
        11, Colors.orange[800]),
    new Fluxo(
        7,
        "Interpretação:\n SÍFILIS RECENTE (primária, secundária ou latente recente)",
        8,
        8,
        Colors.orange[800]),
    new Fluxo(
        8,
        "Tratar imediatamente com dose única de Benzilpenicilina benzatina 2,4 milhões UI, intramuscular.",
        9,
        9,
        Colors.blueAccent[100]),
    new Fluxo(
        9,
        "- Solicitar VDRL imediatamente e agendar retorno para mostrar exame.\n\n"
        "- Fornecer solicitação de VDRL para após 3 meses, 6 meses, 9 meses e 12 meses para monitoramento.",
        10,
        10,
        Colors.yellow),
    new Fluxo(
        10,
        "QUANDO HOUVER ÚLCERA GENITAL OU OUTRO SINTOMA:\n\n" +
            "- notificar o caso para sífilis adquirida e encaminhar à vigilância em até 7 dias.\n" +
            "- avaliar e tratar para SÍFILIS RECENTE as parcerias sexuais dos últimos 3 meses.\n\n" +
            "QUANDO NÃO HOUVER SINTOMAS:\n\n" +
            "Aguardar o resultado do VDRL para notificar o caso",
        0,
        0,
        Colors.green),
    new Fluxo(11, "Solicitar VDRL e aguardar resultado.", 10, 10,
        Colors.blueAccent[100]),
    new Fluxo(12, "O paciente tem úlcera anogenital ou outro sintoma?", 16, 13,
        Colors.orange[800]),
    new Fluxo(
        13,
        "O paciente teve parceria sexual (nos últimos 3 meses)\ncom diagnóstico de sífilis e não foi tratado?",
        16,
        14,
        Colors.orange[800]),
    new Fluxo(14, "Interpretação: Teste NEGATIVO para sífilis", 15, 15,
        Colors.orange[800]),
    new Fluxo(
        15,
        "Orientar periodicidade da testagem:\n\n"
                "- ANUALMENTE: Pessoa com idade menor ou igual a 30 anos: testar;\n\n" +
            "- SEMESTRALMENTE: Gay, HSH, trabalhador(a) do sexo, travesti/transexual, pessoa que usa álcool/outras drogas ou pessoa privada de liberdade; pessoa vivendo com HIV;\n\n" +
            "- TRIMESTRALMENTE: Pessoa em uso de PrEP.",
        0,
        0,
        Colors.blueAccent[100]),
    new Fluxo(
        16,
        "Interpretação: SÍFILIS RECENTE (primária, secundária ou latente recente)",
        17,
        17,
        Colors.orange[800]),
    new Fluxo(
        17,
        "Tratar imediatamente com dose única de Benzilpenicilina benzatina 2,4 milhões UI, intramuscular.",
        18,
        18,
        Colors.blueAccent[100]),
    new Fluxo(
        18,
        "Solicitar VDRL imediatamente e agendar retorno para mostrar exame.",
        19,
        19,
        Colors.blueAccent[100]),
    new Fluxo(
        18,
        "- Orientar sobre a importância de realizar um novo teste rápido para sífilis após 30 dias, devido janela imunológica.\n\n" +
            "- Fornecer solicitação de VDRL mensalmente até o parto. Após o parto, solicitar VDRL a cada 3 meses até que complete 12 meses de monitoramento.",
        19,
        19,
        Colors.yellow),
    new Fluxo(
        19,
        "QUANDO HOUVER ÚLCERA GENITAL OU OUTRO SINTOMA:\n\n" +
            "- notificar o caso para sífilis em gestante e encaminhar à vigilância em até 7 dias.\n\n" +
            "- avaliar e tratar para SÍFILIS RECENTE as parcerias sexuais dos últimos 3 meses.",
        20,
        20,
        Colors.green),
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
    proximo = testeRapido.firstWhere((element) => element.id == id);
    print("RESPOSTA: " + proximo.questao);
    fluxoTesteRapido.sink.add(proximo);
  }

  void dispose() {
    fluxoTesteRapido.close();
  }
}
