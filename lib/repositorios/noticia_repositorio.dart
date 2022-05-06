import 'package:flutter_application_1/classes/noticia_classe.dart';

class NoticiaRepository {
  static List<Noticia> tabela = [
    Noticia(
      titulo_noticia: 'Atraso',
      texto_noticia: 'Iremos atrasar 10 minutos em todos os pontos',
      data_noticia: '30/03/2022',
      hora_noticia: '14:30',
      tipo_noticia: 1),
    Noticia(
      titulo_noticia: 'Atraso',
      texto_noticia: 'Podem ocorrer atrasso de 10 ou mais minutos em todos os pontos durante 4 dias',
      data_noticia: '15/03/2022',
      hora_noticia: '17:30',
      tipo_noticia: 0),
    Noticia(
      titulo_noticia: 'Atraso',
      texto_noticia: 'Iremos atrasar 5 minutos em todos os pontos',
      data_noticia: '10/02/2022',
      hora_noticia: '17:30',
      tipo_noticia: 1),
    Noticia(
      titulo_noticia: 'Atraso',
      texto_noticia: 'Iremos atrasar 15 minutos em todos os pontos',
      data_noticia: '05/03/2022',
      hora_noticia: '15:30',
      tipo_noticia: 1)
  ];
}