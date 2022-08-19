import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_perguntas/answer.dart';
import 'package:projeto_perguntas/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  bool get hasSelectedQuestion {
    return perguntaSelecionada < perguntas.length;
  }

  const Quiz({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion ? perguntas[perguntaSelecionada].cast()['respostas'] : [];
    List<Widget> widgets = answers.map((resp) => Answer(resp['text'].toString(), 
    () => responder(int.parse(resp['pontuacao'].toString())))).toList();

    return Column(
      children: [
        Question(perguntas[perguntaSelecionada]['texto'] as String),
        ...widgets
      ],
    );
  }
}