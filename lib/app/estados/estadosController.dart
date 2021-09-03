import 'package:covid/api/api_casos_brasil.dart';
import 'package:covid/model/estado.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class EstadosController{

  Future<Estado> getCasosEstados() async {
    return await ApiCovid.getCasosEstados();
  }
  Future<Estado> getCasosEstadosPorDia(DateTime time) async {
    return await ApiCovid.getCasosEstadosPorDia(time);
  }
  Future<charts.TimeSeriesChart> getCasosSemanais(int id) async {
    return await ApiCovid.getCasosSemanais(id);
  }
}