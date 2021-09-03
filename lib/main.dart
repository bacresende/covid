import 'package:covid/app/layout/layout_tela.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Painel Covid',
    theme: ThemeData(
      primaryColor: Colors.black,accentColor: Colors.white
    ),
    home: Layout()
  ));
}


