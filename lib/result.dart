import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void Function() reset;

  Result(this.pontuacao, this.reset);

  String get message {
    if(pontuacao <= 15){
      return 'Parabéns!';
    }else if(pontuacao <= 20) {
      return 'Você é bom!';
    }else if(pontuacao <= 25) {
      return 'Impressionante!';
    }else{
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(message, style: TextStyle(fontSize: 28))
        ),
        IconButton(
            onPressed: reset,
            color: Colors.teal, 
            icon: const Icon(Icons.restart_alt_sharp))
      ],
    );
  }
}