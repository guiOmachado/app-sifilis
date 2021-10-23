import 'package:flutter/material.dart';

class Cor {
  Color identificacao = Color.fromARGB(255, 222, 129, 85);
  Color monitoramento = Color.fromARGB(255, 247, 250, 138);
  Color notificacao = Color.fromARGB(255, 121, 215, 148);
  Color assistencia = Color.fromARGB(255, 142, 197, 231);

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
