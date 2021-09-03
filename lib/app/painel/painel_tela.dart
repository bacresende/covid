import 'package:covid/colors_custom.dart';
import 'package:covid/app/painel/painel_controller.dart';
import 'package:covid/app/painel/widgets/InfoCard.dart';
import 'package:covid/model/country.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Painel extends StatefulWidget {
  Painel({Key key}) : super(key: key);

  @override
  _PainelState createState() => _PainelState();
}

class _PainelState extends State<Painel> {
  PainelController controller = new PainelController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Country>(
      future: controller.getCasosBrasil(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            );
            break;

          case ConnectionState.active:
          case ConnectionState.done:
            if (!snapshot.hasData) {
              return Center(
                  child: Text('Não foi possivel carregar os dados',
                      style: TextStyle(color: Colors.grey, fontSize: 20)));
            } else {
              Country country = snapshot.data;

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    InfoCard(
                      controller: controller,
                      titulo: 'Recuperados',
                      numero: '3232343',
                      countryAtual: country,
                      corCard: corVerde,
                    ),
                    InfoCard(
                      controller: controller,
                      titulo: 'Ativos',
                      countryAtual: country,
                      numero: '2212',
                      corCard: corLaranja,
                    ),
                    InfoCard(
                        controller: controller,
                        titulo: 'Confirmados',
                        countryAtual: country,
                        numero: '32392'),
                    InfoCard(
                        controller: controller,
                        titulo: 'Óbitos',
                        countryAtual: country,
                        numero: '3223',
                        corCard: corVermelha),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Dados Atualizados em ${DateFormat("dd 'de' MMMM 'de' yyyy HH:mm", "pt_BR").format(DateTime.parse(country.data.updatedAt).toLocal())}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            }
            break;
        }

        return Container();
      },
    );
  }
}
