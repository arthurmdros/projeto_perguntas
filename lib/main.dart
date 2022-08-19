import 'package:flutter/material.dart';
import 'package:projeto_perguntas/quiz.dart';
import 'package:projeto_perguntas/result.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': [
          {'text': 'Preto', 'pontuacao': 10},
          {'text': 'Azul', 'pontuacao': 7},
          {'text': 'Branco', 'pontuacao': 5},
          {'text': 'Vermelho', 'pontuacao': 3}
        ]
      },
      {
        'texto': 'Qual é seu animal favorito?',
        'respostas': [
          {'text': 'Macaco', 'pontuacao': 10},
          {'text': 'Leão', 'pontuacao': 7},
          {'text': 'Águia', 'pontuacao': 5},
          {'text': 'Tubarão', 'pontuacao': 3}
        ]
      },
      {
        'texto': 'Qual é sua comida favorita?',
        'respostas': [
          {'text': 'Pizza','pontuacao': 9 },
          {'text': 'Parmegiana','pontuacao': 10 },
          {'text': 'Podrão','pontuacao': 8 },
          {'text': 'Lasanha','pontuacao': 7 },
        ]
      }
    ];
  void _responder(int pontuacao){
    if (hasSelectedQuestion){
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciar(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Perguntas'),
        ),
        body: hasSelectedQuestion ? 
        Quiz(
          perguntas: _perguntas, 
          perguntaSelecionada: _perguntaSelecionada, 
          responder: _responder) 
        : Result(_pontuacaoTotal,_reiniciar),
      ),
    );
  }  
}

class PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}