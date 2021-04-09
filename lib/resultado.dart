import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{
  final int pontuacao;
  final void Function() quandoReiniciar;

  Resultado(this.pontuacao, this.quandoReiniciar);

  String get fraseResultado {
    if(pontuacao < 8){
      return 'Parabéns!';
    }else if(pontuacao < 12){
      return 'Você é bom !';
    }else if(pontuacao < 16){
      return 'Impressionante !';
    }else{
      return 'Nivel Transcedente!';
    }
  }
  
  @override
  Widget build(BuildContext Context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ), 
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18)
          ),
          textColor: Colors.greenAccent,
          onPressed: quandoReiniciar,
        )
      ],
    );
  }
}