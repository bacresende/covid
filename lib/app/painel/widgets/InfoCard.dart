import 'package:covid/app/painel/painel_controller.dart';
import 'package:covid/colors_custom.dart';
import 'package:covid/model/country.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatefulWidget {
  final String numero;
  final PainelController controller;
  final String titulo;
  final Color corCard;
  final Country countryAtual;

  InfoCard(
      {@required this.controller,
      @required this.titulo,
      @required this.numero,
      this.corCard = Colors.blue,
      @required this.countryAtual});

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  String numero;
  PainelController controller;
  String titulo;
  Color corCard;

  @override
  void initState() {
    super.initState();

    controller = widget.controller;
    titulo = widget.titulo;
    corCard = widget.corCard;
    numero = widget.numero;
    numero = NumberFormat('###,###', 'pt_BR').format(double.parse(numero));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: Card(
        color: corCard,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    titulo,
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    numero,
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              FutureBuilder<Country>(
                  future: controller.getCountryAnterior(widget.countryAtual),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Country countryOntem = snapshot.data;
                      return infoComparacao(countryOntem);
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoComparacao(Country countryOntem) {
    if (titulo == 'Óbitos') {
      String porcentagem =
          controller.porcentagemCasos(numero, countryOntem.data.deaths);

      return Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 12),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Text(
                  '35 %',
                  style: TextStyle(
                      color: corVermelha, fontWeight: FontWeight.w500),
                )),
          ),
          Positioned(
              left: 40,
              top: 5,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: double.parse(porcentagem) >= 0
                      ? Icon(
                          Icons.arrow_upward,
                          size: 30,
                          color: corVermelha,
                        )
                      : Icon(
                          Icons.arrow_downward,
                          size: 30,
                          color: corVermelha,
                        )))
        ],
      );
    } else if (titulo == 'Confirmados') {
      String porcentagem =
          controller.porcentagemCasos(numero, countryOntem.data.confirmed);
      return Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 12),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Text(
                  '33%',
                  style:
                      TextStyle( fontWeight: FontWeight.w500),
                )),
          ),
          Positioned(
              left: 40,
              top: 5,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: double.parse(porcentagem) >= 0
                      ? Icon(
                          Icons.arrow_upward,
                          size: 30,
                        )
                      : Icon(
                          Icons.arrow_downward,
                          size: 30,
                        )))
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(
            Icons.arrow_upward,
            size: 30,
            color: titulo == 'Recuperados' ? corVerde : corLaranja,
          )),
    );
  }
}
