import 'dart:async';

import 'package:flutter_application_1/model/equipe.dart';

class EquipeBloc {
  StreamController equipeBloc = StreamController.broadcast();

  Stream get equipeStream => equipeBloc.stream;

  List<Equipe> equipe = [
    Equipe(
        "Fernanda Vaz Dorneles",
        " - Enfermeira. Especialista Binacional em Saúde Brasil/Uruguay.\n - Especialista em Gestão de Emergência em Saúde Pública.\n - Especialista em Administração Hospitalar.\n - Mestranda pela Pós-Graduação em Enfermagem (PPGEnf)\n – Mestrado Profissional da Universidade Federal de Ciências da Saúde de Porto Alegre (UFCSPA).\n - Membro do Grupo de Pesquisa em Tecnologia, Gestão Educação e Segurança no Trabalho (TeGEST)/UFCSPA.\n - Coordenadora do Núcleo de Doenças Transmissíveis Crônicas da Diretoria de\n Vigilância em Saúde da Secretaria Municipal de Saúde de Porto Alegre.",
        "assets/fotos/foto_fernanda.PNG"),
    Equipe(
        "Amanda Curtinaz de Oliveira",
        " - Acadêmica do Curso de Bacharelado em Enfermagem da UFCSPA.\n - Bolsista de Iniciação Científica Voluntária.\n - Membro do TeGEST.",
        "assets/fotos/foto_amanda.PNG"),
    Equipe(
        "Mariana Xavier da Silva",
        " - Acadêmica do Curso de Bacharelado em Enfermagem da UFCSPA.\n - Bolsista de Iniciação Científica Voluntária.\n - Membro do TeGEST.",
        "assets/fotos/foto_mariana.PNG"),
    Equipe(
        "Daniela Barbosa Behrends",
        " - Acadêmica de Design Visual na Universidade Federal do Rio Grande do Sul (UFRGS).\n - Colaboradora do Núcleo de Produção e Design do Projeto da Universidade Aberta do Sistema Único de Saúde (UNA-SUS) da UFCSPA.\n - Membro do Grupo de Pesquisa TeGEST.",
        "assets/fotos/foto_daniela.PNG"),
    Equipe(
        "Adriana Aparecida Paz",
        " - Enfermeira. Mestre e Doutora em Enfermagem.\n - Professora Adjunta do Departamento de Enfermagem nos Cursos de Bacharelado em Enfermagem. Bacharelado em Informática Biomédica, e no PPGEnf.\n – Mestrado Profissional da UFCSPA.\n - Líder do Grupo de Pesquisa TeGEST.\n - Vice Coordenadora Geral do Projeto UNA-SUS/UFCSPA.\n - Conselheira do Conselho Regional de Enfermagem do Rio Grande do Sul (COREN-RS) gestão 2018-2023.",
        "assets/fotos/foto_adriana.PNG"),
    Equipe(
       "João Victor Correa Saldanha",
        " - Acadêmico do Curso de Bacharelado em Informática Biomédica da UFCSPA.\n - Bolsista de Iniciação Tecnológica e Inovação da Fundação de Amparo a\n Pesquisa do Estado do Rio Grande do Sul (FAPERGS).\n - Membro do TeGEST.",
        "assets/fotos/foto_joaoSaldanha.jpeg"),
    Equipe(
        "Guilherme Machado Silva",
        " - Acadêmico do Curso de Bacharelado em Informática Biomédica da UFCSPA.\n - Bolsista de Iniciação Tecnológica e Inovação da Fundação de Amparo a\n Pesquisa do Estado do Rio Grande do Sul (FAPERGS).\n - Membro do TeGEST.",
        "assets/fotos/foto_guilherme.jpeg")
  ];

  void dispose() {
    equipeBloc.close();
  }
}
