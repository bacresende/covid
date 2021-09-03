import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bandeiras {
  static dynamic getBandeira(String uf) {
    Map<String, String> bandeiras = {
      'AC':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852740bandeiraacre.png',
      'AL':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743Bandeira_de_Alagoas.svg.png',
      'AP':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744Bandeira_do_Amap.svg.png',
      'AM':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744Bandeira_do_Amazonas.svg.png',
      'BA':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeirabahia.png',
      'CE':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeiraceara.png',
      'DF':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeiradistritofederal.png',
      'ES':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeiraespiritosanto.png',
      'GO':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeiragoias.png',
      'MA':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeiradomaranhao.jpg',
      'MT':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeiramatogrosso.png',
      'MS':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744bandeira_Mato_Grosso_Sul.png',
      'MG':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743Bandeira_de_Minas_Gerais.svg.png',
      'PA':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744Bandeira_do_Par.svg.png',
      'PR':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeiraparana.png',
      'PB':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeiraparaiba.png',
      'PE':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741BandeiradePernambuco.png',
      'PI':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeirapiaui.png',
      'RJ':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeirariodejaneiro.png',
      'RN':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeirariograndedonorte.png',
      'RS':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeirariograndedosul.png',
      'RO':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeirarondonia.png',
      'RR':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeiraroraima.png',
      'SC':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeirasantacatarina.png',
      'SP':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744Bandeira_do_estado_de_S_Paulo.svg.png',
      'SE':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeirasergipe.png',
      'TO':
          'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeiratocantins.png'
    };
    return bandeiras.containsKey('$uf')
        ? Container(
          width: 77,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              elevation: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(bandeiras[uf],),
              )),
        )
        : Icon(Icons.flare);
  }
}
