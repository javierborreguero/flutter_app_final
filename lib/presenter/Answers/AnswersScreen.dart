import 'package:flutter/material.dart';

class AnswersScreen extends StatefulWidget {
  final int position;

  AnswersScreen(this.position);

  @override
  _AnswersScreenState createState() => _AnswersScreenState();
}

class _AnswersScreenState extends State<AnswersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pregunta"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (c, position) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop(position);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                child: Center(child: Text("Item $position")),
              ),
            ),
          );
        },
      ),
    );
  }
}
