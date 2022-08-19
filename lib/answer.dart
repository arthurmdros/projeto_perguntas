import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Answer extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  Answer(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 40),
              // Foreground color
              onPrimary: Colors.white,
              // Background color
              primary: Colors.teal,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: onSelection, 
          child: Text(texto)
        )
      ),
    );
  }
}
    // Container(
    //   margin: EdgeInsets.all(10),
    //   child: Text(
    //     texto,
    //     style: TextStyle(fontSize: 18),
    //     textAlign: TextAlign.center,
    //   )
    // )