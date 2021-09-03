import 'package:covid/api/api_casos_brasil.dart';
import 'package:covid/app/estados/estadosController.dart';
import 'package:covid/model/country.dart';
import 'package:covid/model/estado.dart';

class PainelController {
  Future<Country> getCasosBrasil() async {
    return await ApiCovid.getCasosBrasil();
  }

  Future<Country> getCountryAnterior(Country countryAtual) async {
    EstadosController controller = EstadosController();
    Estado estados = await controller.getCasosEstadosPorDia(DateTime.parse(countryAtual.data.updatedAt).subtract(Duration(days: 7)));
    
    var casos = 0;
    var obitos = 0;
    for (var data in estados.data) {
      casos += data.cases;
      obitos += data.deaths;
      
    }
return Country(data: DataPais(confirmed: casos, deaths: obitos));
  }

  String porcentagemCasos(String numeroHoje, int numeroOntem) {
    String resultado = '0';
    if (numeroOntem != 0) {
      numeroHoje = numeroHoje.replaceAll('.', '');
      int aumento = int.parse(numeroHoje) - numeroOntem;
      resultado = ((aumento / numeroOntem) * 100).toStringAsFixed(1);
    }

    return resultado;
  }
}
