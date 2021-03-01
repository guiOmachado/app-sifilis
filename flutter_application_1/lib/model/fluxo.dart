class Fluxo {
  final int id;
  final String questao;
  final int sim;
  final int nao;

  Fluxo(this.id, this.questao, this.sim, this.nao);

  Fluxo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        questao = json['questao'],
        sim = json['sim'],
        nao = json['nao'];

  Map<String, dynamic> toJson() =>
      {'name': id, 'questao': questao, 'sim': sim, 'nao': nao};
}
