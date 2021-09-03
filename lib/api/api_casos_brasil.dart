import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid/app/estados/widgets/chart.dart';
import 'package:covid/model/country.dart';
import 'package:covid/model/estado.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiCovid {
  static String urlPadrao = 'https://covid19-brazil-api.now.sh/api/report/v1';

  static Future<Country> getCasosBrasil() async {
    http.Response response = await http.get('$urlPadrao/brazil');

    if (response.statusCode == 200) {
      return Country.fromJson(json.decode(response.body));
    }
    return null;
  }

  static Future<Estado> getCasosEstados() async {
    http.Response response = await http.get('$urlPadrao');

    if (response.statusCode == 200) {
      return Estado.fromJson(json.decode(response.body));
    }
    return null;
  }

  static Future<Estado> getCasosEstadosPorDia(DateTime time) async {
    http.Response response = await http.get('$urlPadrao/brazil/${DateFormat('yyyyMMdd').format(time)}');
    if (response.statusCode == 200) {
      return Estado.fromJson(json.decode(response.body));
    }
    return null;
  }

  static Future<charts.TimeSeriesChart> getCasosSemanais(int id) async {
    DateTime data = DateTime.now().subtract(Duration(days: 105));
    http.Response response;
    String dataFormatada;
    List<ChartItem> itens = List();
    List<ChartItem> itens2 = List();
    while (data.isBefore(DateTime.now())) {
      dataFormatada = DateFormat('yyyyMMdd').format(data);
      response = await http.get('$urlPadrao/brazil/$dataFormatada');
      if (response.statusCode == 200) {
        for (var item in Estado.fromJson(json.decode(response.body)).data) {
          if (item.uid == id) {
            itens.add(ChartItem(data, item.cases));
            itens2.add(ChartItem(data, item.deaths));
            continue;
          }
        }
      }
      data = data.add(Duration(days: 7));
    }
    return charts.TimeSeriesChart(
      ChartCasos.newSeries(itens, itens2),
      animate: true,
    );
  }
}
