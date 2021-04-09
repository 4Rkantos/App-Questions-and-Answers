import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(_PerguntaApp());

class _PerguntaAppState extends State<_PerguntaApp>{
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto':'Preto', 'pontuacao': 1}, 
        {'texto':'Vermelho', 'pontuacao': 3},
        {'texto':'Verde', 'pontuacao': 10}, 
        {'texto':'Branco', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
      {'texto':'Coelho', 'pontuacao': 10},
      {'texto':'Cobra', 'pontuacao': 5}, 
      {'texto':'Elefante', 'pontuacao': 3},
      {'texto':'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual a sua comida favorita?',
      'respostas': [
        {'texto':'Lasanha', 'pontuacao': 10},
        {'texto':'Pizza', 'pontuacao': 3},
        {'texto':'Churrasco', 'pontuacao': 5}, 
        {'texto':'Sushi', 'pontuacao': 1},
      ],
    }
  ];

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  void _responder(int pontuacao){
    if(temPerguntaSelecionada){
      setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Colors.greenAccent,
        ),
        body: temPerguntaSelecionada 
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder,
            )
         : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class _PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}