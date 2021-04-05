import 'package:flutter/material.dart';

class Fluxo {
  final int id;
  final String questao;
  final int sim;
  final int nao;
  final Color cor;

  Fluxo(this.id, this.questao, this.sim, this.nao, this.cor);

  Fluxo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        questao = json['questao'],
        sim = json['sim'],
        nao = json['nao'],
        cor = json['cor'];

  Map<String, dynamic> toJson() =>
      {'name': id, 'questao': questao, 'sim': sim, 'nao': nao, 'cor': cor};
}
