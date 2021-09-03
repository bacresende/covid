import 'package:covid/model/precaucao.dart';
import 'package:flutter/material.dart';

class PrecaucoesController{
  
  PageController ctrl = new PageController();
  int currentPage = 0;
  List<Precaucao> precaucoes = [
    Precaucao('Mãos', 'Lavar frequentemente', 'imagens/lavar_maos.jpg'),
    Precaucao('Cotovelo', 'Usar para cobrir a tosse', 'imagens/espirrar_cotovelo.jpg'),
    Precaucao('Rosto', 'Não tocar', 'imagens/maos_no_rosto.jpg'),
    Precaucao('Espaço', 'Manter distância segura', 'imagens/mantenha_distancia.jpg'),
    Precaucao('Casa', 'Não sair, se possível', 'imagens/ficar_em_casa.jpg'),
  ];
}