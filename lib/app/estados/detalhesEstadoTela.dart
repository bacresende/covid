import 'package:admob_flutter/admob_flutter.dart';
import 'package:covid/app/estados/widgets/chart.dart';
import 'package:covid/app/estados/widgets/info_card_estado.dart';
import 'package:covid/colors_custom.dart';
import 'package:covid/model/estado.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalhesEstadoTela extends StatefulWidget {
  final Data data;
  DetalhesEstadoTela(this.data);

  @override
  DetalhesEstadoTelaState createState() => DetalhesEstadoTelaState();
}

class DetalhesEstadoTelaState extends State<DetalhesEstadoTela> {
String dataAtual = '';
@override
  void initState() {
    super.initState();
    //dataAtual = DateFormat("dd 'de' MMMM 'de' yyyy HH:mm", "pt_BR").format(DateTime.parse(widget.data.datetime).toLocal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.data.state}'),
        ),
        body: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            ChartCasos(widget.data.uid),
            SizedBox(
              height: 50,
            ),
            InfoCardEstado(
                corCard: corVerde,
                titulo: 'Confirmados',
                numero: '5456'),
            InfoCardEstado(
              corCard: corVermelha,
              titulo: 'Óbitos',
              numero: '154',
            ),
            Text(
              'Dados Atualizados em ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400]),
            ),
          ],
        ));
  }
}
