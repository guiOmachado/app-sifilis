import 'package:flutter/material.dart';

class Equipe {
  final String nome;
  final String descricao;
  final String foto;

  Equipe(this.nome, this.descricao, this.foto);

  Equipe.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        descricao = json['descricao'],
        foto = json['foto'];

  Map<String, dynamic> toJson() =>
      {'nome': nome, 'descricao': descricao, 'foto': foto};
}
