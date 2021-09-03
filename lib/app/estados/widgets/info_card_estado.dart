import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCardEstado extends StatefulWidget {
  final Color corCard;
  final String titulo;
  final String numero;

  InfoCardEstado({this.corCard, this.titulo, this.numero});
  @override
  _InfoCardEstadoState createState() => _InfoCardEstadoState();
}

class _InfoCardEstadoState extends State<InfoCardEstado> {

String numero;

@override
  void initState() {
    super.initState();
    numero = widget.numero;
    numero = NumberFormat('###,###', 'pt_BR').format(double.parse(numero));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: Card(
        color: widget.corCard,
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
                    widget.titulo,
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '12',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}