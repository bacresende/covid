import 'package:covid/app/estados/detalhesEstadoTela.dart';
import 'package:covid/app/estados/estadosController.dart';
import 'package:covid/model/estado.dart';
import 'package:covid/util/utilitario.dart';
import 'package:flutter/material.dart';

class EstadosTela extends StatefulWidget {
  EstadosTela({Key key}) : super(key: key);

  @override
  _EstadosTelaState createState() => _EstadosTelaState();
}

class _EstadosTelaState extends State<EstadosTela> {
  EstadosController controller = EstadosController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Estado>(
      future: controller.getCasosEstados(),
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
                child: Text('Não foi possivel carregar os dados', style: TextStyle(color: Colors.grey, fontSize: 20),),
              );
            } else {
              Estado estado = snapshot.data;

              estado.data.sort((a, b) => a.state.compareTo(b.state));

              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: estado.data.length,
                  itemBuilder: (context, index) {
                    Data item = estado.data[index];

                    return ListTile(
                      leading: Bandeiras.getBandeira(item.uf),
                      title: Text(item.state),
                      subtitle: Text('${item.deaths} Óbitos'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetalhesEstadoTela(item);
                        }));
                      },
                    );
                  });
            }
            break;
        }

        return Container();
      },
    );
  }
}
