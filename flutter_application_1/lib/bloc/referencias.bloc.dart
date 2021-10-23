import 'dart:async';

class ReferenciasBloc {
  StreamController referenciasBloc = StreamController.broadcast();

  Stream get referenciasStream => referenciasBloc.stream;

  List<String> referencias = [
    "1. Conselho Federal de Enfermagem (COFEN). Lei nº 7.498/86, de 25 de junho de 1986. Dispõe sobre a regulamentação do exercício da Enfermagem e dá outras providências [Internet]; COFEN, 1986. Disponível em: <http://novo. portalcofen.gov.br/lei-n-749886-de-25-de-junho-de-1986_4161.html>. Acesso em: 03 de janeiro de 2021.",
    "2. Conselho Federal de Enfermagem (COFEN). Resolução n. 195/1997: dispõe sobre a solicitação de exames de rotina e complementares por Enfermeiro [online]. COFEN; 1997. Disponível em: <http://www.cofen.gov.br/resoluocofen-1951997_4252.html>. Acesso em: 03 de janeiro de 2021.",
    "3. Prefeitura Municipal de Florianópolis (SC). Secretaria Municipal de Saúde. Protocolo de enfermagem para infecções sexualmente transmissíveis e outras doenças transmissíveis de interesse em saúde coletiva (dengue/tuberculose). Volume 2. Florianópolis, 2017.",
    "4. Brasil. Ministério da Saúde. Secretaria de Atenção à Saúde. Departamento de Atenção Básica. Saúde Sexual e Reprodutiva. Série A. Normas e Manuais Técnicos. Cadernos de Atenção Básica, n. 26. Brasília: Ministério da Saúde, 2010.",
    "5. Brasil. Ministério da Saúde. Secretaria de Vigilância em Saúde. Departamento de Doenças de Condições Crônicas e Infecções Sexualmente Transmissíveis. Protocolo Clínico e Diretrizes Terapêuticas para Atenção Integral às Pessoas com Infecções Sexualmente Transmissíveis (IST)/Ministério da Saúde, Secretaria de Vigilância em Saúde, Departamento de Doenças de Condições Crônicas e Infecções Sexualmente Transmissíveis. – Brasília: Ministério da Saúde, 2020.",
    "6. Clutterbuck DJ; Flowers P; Barber T et al. The Clinical Effectiveness Group of British Association for Sexual Health and HIV (BASHH) and British HIV Association (BHIVA). UK national guideline on safer sex advice. Int. J. STD. AIDS, [S.l.], v. 23, n. 6, p. 381-8, jun. 2012.",
    "7. Nusbaum MR; Hamilton CD. The proactive sexual health history. Am. Fam. Physician, [S.l.], v. 66, n. 9, p. 1705-12, 1 nov. 2002.",
    "8. Rolfs RT et al. A randomized trial of enhanced therapy for early syphilis in patients with and without human immunodeficiency virus infection. N. Engl. J. Med., [S.l.], v. 337, p. 307-314, 1997.",
    "9. Peeling RW; Mabey D; Kamb ML et al. Syphilis. Nat. Rev. Dis. Primers, [S.l.], v. 3, p. 17073, 12 out. 2017.",
    "10. Prefeitura Municipal de Porto Alegre (RS). Secretaria Municipal de Saúde. Protocolo de enfermagem para enfermeiras (os) do município de Porto Alegre: infecções sexualmente transmissíveis. Porto Alegre, 2019.",
    "11. Brasil. Ministério da Saúde. Secretaria de Vigilância em Saúde. Coordenação-Geral de Desenvolvimento da Epidemiologia em Serviços. Guia de Vigilância em Saúde: volume único [recurso eletrônico] / Ministério da Saúde, Secretaria de Vigilância em Saúde, Coordenação-Geral de Desenvolvimento da Epidemiologia em Serviços. – 3ª. ed. – Brasília : Ministério da Saúde, 2019.",
    "12. Brasil. Ministério da Saúde. Secretaria de Atenção à Saúde. Departamento de Ações Programáticas Estratégicas. Coordenação Nacional de Saúde do Homem. Guia do pré-natal do parceiro para profissionais de saúde. Brasília: Ministério da Saúde, 2016.",
    "13. Brasil. Ministério da Saúde. Secretaria de Ciência, Tecnologia e Insumos Estratégicos. Departamento de Assistência Farmacêutica e Insumos Estratégicos. Relação Nacional de Medicamentos Essenciais: Rename 2017. Brasília: Ministério da Saúde, 2017a.",
    "14. Conselho Federal de Enfermagem (COFEN). Parecer nº 09/2016/CTAS/COFEN, de 6 de maio de 2016. Solicitação de parecer sobre a administração de medicamentos por via IM em pacientes que usam prótese de silicone. Brasília: COFEN, 2016. Disponível em: <http://www.cofen.gov.br/parecer-no-092016ctascofen_42147.html>. Acesso em: 03 de janeiro de 2021.",
    "15. Seña AC; Wolff M; Behets F et al. Rate of Decline in nontreponemal antibody titers and seroreversion after treatment of early syphilis. Sex. Transm. Dis., [S.l.], v. 44, n. 1, p. 6-10, jan. 2017.",
    "16. Butler T. The Jarisch-Herxheimer reaction after antibiotic treatment of spirochetal infections: a review of recent cases and our understanding of pathogenesis. Am. J. Trop. Med. Hyg., [S.l.], v. 96, n. 1, 2017, p. 46-52, 2017.",
    "17. Brasil. Ministério da Saúde. Secretaria de Vigilância em Saúde. Departamento de Vigilância, Prevenção e Controle das Infecções Sexualmente Transmissíveis, do HIV/ Aids e das Hepatites Virais. Protocolo Clínico e Diretrizes Terapêuticas para Prevenção da Transmissão Vertical de HIV, Sífilis e Hepatites Virais. Brasília: Ministério da Saúde, 2017b.",
    "18. Brasil. Ministério da Saúde. Secretaria de Ciência, Tecnologia e Insumos Estratégicos. Comissão Nacional de Incorporação de Tecnologias no SUS (Conitec). Penicilina benzatina para prevenção da Sífilis Congênita durante a gravidez. Relatório de recomendação n. 150. Brasília: Ministério da Saúde, jan. 2015.",
    "19. Brasil. Ministério da Saúde. Secretaria de Atenção à Saúde. Departamento de Atenção Básica. Acolhimento à demanda espontânea: Queixas mais comuns na Atenção Básica. Cadernos de Atenção Básica, n. 28, v. II. Brasília: Ministério da Saúde, 2013.",
    "20. Conselho Federal de Enfermagem (COFEN). Decisão n° 0094/2015, de 8 de julho de 2015. Revoga o Parecer de Conselheiro 008/2014. PAD COFEN 032/2012. Administração de penicilina pelos profissionais de enfermagem. Brasília: COFEN, 2015. Disponível em: <http://www.cofen.gov.br/decisao-cofen-no-00942015_32935>. Acesso em: 03 de janeiro de 2021.",
    "21. Conselho Federal de Enfermagem (COFEN). Nota Técnica COFEN/CTLN nº 03/2017, de 14 de junho de 2017. Esclarecimento aos profissionais de enfermagem sobre a importância da administração da Penicilina Benzatina nas Unidades Básicas de Saúde (UBS) do Sistema Único de Saúde (SUS). Brasília: COFEN, 2017. Disponível em:<http://www.cofen.gov.br/wp-content/uploads/2017/06/NOTA-T%C3%89CNICA-COFEN-CTLN-N%C2%B0-03-2017.pdf>. Acesso em: 03 de janeiro de 2021.",
    "22. Shenoy ES; Macy E; Rowe T et al. Evaluation and Management of Penicillin Allergy: A Review. JAMA, [S.l.], v. 2, n. 321, p. 188-199, 2019. p. 162.",
    "23. Galvao TF; Silva MT; Serruya SJ et al. Safety of benzathine penicillin for preventing congenital syphilis: a systematic review. PLoS One, [S.l.], v. 8, n. 2, p. e56463, 2013. p. 154.",
    "24. Brasil. Ministério da Saúde. Secretaria de Vigilância em Saúde. Departamento de Vigilância, Prevenção e Controle das Infecções Sexualmente Transmissíveis, do HIV/ Aids e das Hepatites Virais. Prevenção Combinada do HIV: Bases conceituais para profissionais trabalhadores(as) e gestores(as) de saúde. Brasília: Ministério da Saúde, 2017c.",
    "25. Brasil. Ministério da Saúde. Nota Técnica Informativa nº 2 ‐ sei/2017 ‐ DIAHV/SVS/MS. Altera os Critérios de Definição de Casos para Notificação de Sífilis Adquirida, Sífilis em Gestante e Síflis Congênita. Disponível em: http://portalsinan.saude.gov.br/images/documentos/Agravos/Sifilis‐ Ges/Nota_Informativa_Sifilis.pdf.",
    "26. Brown ST; Zaidi A; Larsen SA et al. Serological response to syphilis treatment. A new analysis of old data. JAMA, [S.l.], v. 253, n. 9, p. 1296-9, 1985.",
    "27. Seña AC; Zhang XH; Li T et al. A systematic review of syphilis serological treatment outcomes in HIV-infected and HIV-uninfected persons: rethinking the significance of serological non-responsiveness and the serofast state after therapy. BMC Infect. Dis., [S.l.], v. 15, p. 479, 2015",
    "28. Romanowski B; Sutherland R; Fick GH et al. Serologic response to treatment of infectious syphilis. Ann. Intern. Med., [S.l.], v. 114, p. 1005-1009, 1991.",
    "29. Tong ML; Lin LR; Liu GL et al. Factors associated with serological cure and the serofast state of HIV-negative patients with primary, secondary, latent, and tertiary syphilis. PLoS One, [S.l.], v. 8, n. 7, p. e70102, 23 jul. 2013.",
    "30. Clement ME; Okeke NL; Hicks CB. Treatment of syphilis: a systematic review. JAMA, [S.l.], v. 312, n. 18, p. 1905-17, 12 nov. 2014.",
    "31. Workowski K A; Bolang GA. Centers for Disease Control and Prevention. Sexually transmitted diseases treatment guidelines, 2015. MMWR, [S.l.], v. 64, RR03, p. 1, 5 jun. 2015.",
    "32. Zhang RL; Wang QQ.; Zhang JP et al. Molecular subtyping of Treponema pallidum and associated factors of serofast status in early syphilis patients: identified novel genotype and cytokine marker. PLoS One, [S.l.], v. 12, n. 4, p. e0175477, 14 abr. 2017.",
    "33. Tuddenham S; Ghanem KG. Neurosyphilis: Knowledge Gaps and Controversies. Sex. Transm. Dis., [S.l.], v. 45, n. 3, p. 147-151, mar 2018.",
    "34. Musher DM. Editorial commentary: polymerase chain reaction for the tpp47 gene: a new test for neurosyphilis. Clin. Inf. Dis., [S.l.], v. 63, n. 9, p. 1187-1188, 2016.",
    "35. Marra CM. Neurosyphilis. Continuum, Minneapolis, v. 21, n. 6, p.1714-28, dez. 2015.",
    "36. Marra CM; Maxwell CL; Tantalo LC et al. The rapid plasma reagin test cannot replace the venereal disease research laboratory test for neurosyphilis diagnosis. Sex. Transm. Dis., [S.l.], v. 39, n. 6, p. 453-457, 2012.",
    "37. Marra CM; Maxwell CL; Dunaway SB et al. Cerebrospinal fluid Treponema pallidum particle agglutination assay for neurosyphilis diagnosis. J. Clin. Microbiol., [S.l.], v. 55, n. 6, p. 1865-1870, jun. 2017.",
    "38. Chesney SOU; Kemp JE. Incidence of Spirochaeta pallida in cerebrospinal fluid during early stage of syphilis. JAMA, [S.l.], v. 24, p. 736-740, 1924.",
    "39. Madiedo G; Ho KC; Walsh P. False-positive VDRL and FTA in cerebrospinal fluid. JAMA, [S.l.], v. 244, n. 7, p. 688-689, 1980.",
    "40. Lukehart SA; Hook III EW; Baker-Zander SA et al. Invasion of the central nervous system by Treponema pallidum: implications for diagnosis and treatment. Ann. Intern. Med., [S.l.], v. 109, p. 855-862, 1988.",
    "41. Marra CM; Maxwell CL; Tantalo LC et al. Normalization of serum rapid plasma reagin titer predicts normalization of cerebrospinal fluid and clinical abnormalities after treatment of neurosyphilis. Clin. Infect. Dis., [S.l.], v. 47, n. 7, p. 893- 899, 2008."
  ];

  //resposta() {
  // referenciasBloc.sink.add(referencias);
  // }

  void dispose() {
    referenciasBloc.close();
  }
}
