import 'package:covid/colors_custom.dart';
import 'package:covid/app/estados/estadosController.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartCasos extends StatefulWidget {
  final EstadosController controller = EstadosController();
  final int id;
  ChartCasos(this.id);

  @override
  ChartCasosState createState() => ChartCasosState();

  static List<charts.Series<ChartItem, DateTime>> newSeries(
      List<ChartItem> data, List<ChartItem> data2) {
    return [
      new charts.Series<ChartItem, DateTime>(
        id: 'Dados 01',
        data: data,
        domainFn: (ChartItem item, _) => item.x,
        measureFn: (ChartItem item, _) => item.y,
        colorFn: (item, _) {
          return charts.ColorUtil.fromDartColor(corVerde);
        },
        labelAccessorFn: (item, _) {
          return '';
        },
      ),
      new charts.Series<ChartItem, DateTime>(
        id: 'Dados 02',
        data: data2,
        domainFn: (ChartItem item, _) => item.x,
        measureFn: (ChartItem item, _) => item.y,
        colorFn: (item, _) {
          return charts.ColorUtil.fromDartColor(corVermelha);
        },
        labelAccessorFn: (item, _) {
          return '';
        },
      )
    ];
  }
}

class ChartCasosState extends State<ChartCasos> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<charts.TimeSeriesChart>(
      future: widget.controller.getCasosSemanais(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                    Text('Carregando os Dados', style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),
            ),
          );
        } else {
          charts.TimeSeriesChart series = snapshot.data;

          if (series == null) {
            return Center(child: Text('Não foi possivel carregar os dados'));
          }
          return Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: SizedBox(
              height: 200,
              child: series,
            ),
          );
        }
      },
    );
  }
}

class ChartItem {
  final DateTime x;
  final int y;

  ChartItem(this.x, this.y);
}
