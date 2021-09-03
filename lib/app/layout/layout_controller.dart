import 'package:covid/app/estados/estados_tela.dart';
import 'package:covid/app/painel/painel_controller.dart';
import 'package:covid/app/painel/painel_tela.dart';
import 'package:covid/app/precaucoes/precaucoes_tela.dart';
import 'package:covid/model/country.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

class LayoutController {
  List<Widget> widgetOptions = <Widget>[
    Painel(),
    EstadosTela(),
  ];

  String titulo = 'Painel Covid-19 Brasil';
  int indiceNavegacao = 0;

  void onTapped(int index) {
    indiceNavegacao = index;

    if (indiceNavegacao == 0) {
      titulo = 'Painel Covid-19 Brasil';
    } else {
      titulo = 'Estados Brasileiros Covid-19';
    }
  }

  void share() async {
    final c = PainelController();
    Country country = await c.getCasosBrasil();
    String mensagem = '';
  }

  void telaPrecaucoes(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Precaucoes()));
  }
}
