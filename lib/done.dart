import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/card.dart';
import 'package:notebook/main.dart';
// import 'package:provider/provider.dart';
import 'package:notebook/todo.dart';

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  late Stream<List<Todo>> streamTodos;

  @override
  void initState() {
    super.initState();
    streamTodos = objectBox.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<TodoList>(context, listen: true);

    return StreamBuilder<List<Todo>>(
        stream: streamTodos,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Empty"),
            );
          } else {
            final todoss = snapshot.data!
                .where((element) => element.done == true)
                .toList();
            return ListView.builder(
              itemBuilder: (context, index) {
                return Cardd(
                  note: todoss[index],
                  Ico: const FaIcon(FontAwesomeIcons.squareCheck),
                );
              },
              itemCount: todoss.length,
            );
          }
        });
  }
}
