import 'package:covid/model/precaucao.dart';
import 'package:flutter/material.dart';

class InfoCardPrecaucao extends StatefulWidget {
  final bool active;
  final Precaucao precaucao;

  InfoCardPrecaucao(this.active, this.precaucao);
  @override
  _InfoCardPrecaucaoState createState() => _InfoCardPrecaucaoState();
}

class _InfoCardPrecaucaoState extends State<InfoCardPrecaucao> {
  double blur;
  double offset;
  double top;

  @override
  void initState() {
    super.initState();
    blur = widget.active ? 30 : 0;
    offset = widget.active ? 20 : 0;
    top = widget.active ? 100 : 200;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, left: 30, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.precaucao.imagem),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black87,
                blurRadius: blur,
                offset: Offset(offset, offset))
          ]),
      child: Center(
        child: Text(
          widget.precaucao.titulo,
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  }
}
