import 'package:flutter/material.dart';

class Cor {
  Color identificacao = Colors.orange[800];
  Color monitoramento = Colors.yellow;
  Color notificacao = Colors.green;
  Color assistencia = Colors.blueAccent[100];

  Cor();

  Cor.fromJson(Map<String, dynamic> json)
      : identificacao = json['identificacao'],
        monitoramento = json['monitoramento'],
        notificacao = json['notificacao'],
        assistencia = json['assistencia'];
  Map<String, dynamic> toJson() => {
        'identificacao': identificacao,
        'monitoramento': monitoramento,
        'notificacao': notificacao,
        'assistencia': assistencia
      };
}
