import 'package:covid/app/precaucoes/precaucoes_controller.dart';
import 'package:covid/model/precaucao.dart';
import 'package:flutter/material.dart';

class Precaucoes extends StatefulWidget {
  @override
  _PrecaucoesState createState() => _PrecaucoesState();
}

class _PrecaucoesState extends State<Precaucoes> {
  PrecaucoesController controller = new PrecaucoesController();
  List<String> imagens = [
    'imagens/lavar_maos_blur.jpeg',
    'imagens/espirrar_cotovelo_blur.jpg',
    'imagens/maos_no_rosto_blur.jpg',
    'imagens/mantenha_distancia_blur.jpg',
    'imagens/ficar_em_casa_blur.jpg'
  ];
  int indexGlobal = 0;

  @override
  void initState() {
    super.initState();
    controller.ctrl.addListener(() {
      int next = controller.ctrl.page.round();

      indexGlobal = next;

      if (controller.currentPage != next) {
        setState(() {
          controller.currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(imagens[indexGlobal])),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: controller.ctrl,
                itemCount: controller.precaucoes.length,
                itemBuilder: (context, currentIdx) {
                  bool active = currentIdx == controller.currentPage;
                  return infoCardPrecaucao(
                      controller.precaucoes[currentIdx], active);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Voltar'),
        tooltip: 'Voltar',
        icon: Icon(Icons.arrow_left),
        onPressed: (){
          Navigator.pop(context);
        }
        ),
    );
  }

  infoCardPrecaucao(Precaucao precaucao, bool active) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 10 : 0;
    final double top = active ? 100 : 200;

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOutQuint,
          margin: EdgeInsets.only(top: top, bottom: 50, left: 30, right: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  fit: BoxFit.cover,
                  image: AssetImage(precaucao.imagem)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black87,
                    blurRadius: blur,
                    offset: Offset(offset, offset))
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  precaucao.destricao,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 14.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 70,
            left: precaucao.titulo == 'Cotovelo'
                ? 110
                : precaucao.titulo == 'Espaço' ? 120 : 135,
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    precaucao.titulo,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    ),
                  ),
                )))
      ],
    );
  }
}
