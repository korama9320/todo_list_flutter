import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/card.dart';
import 'package:notebook/main.dart';
// import 'package:provider/provider.dart';
import 'package:notebook/todo.dart';

class ToBeDone extends StatefulWidget {
  const ToBeDone({super.key});

  @override
  State<ToBeDone> createState() => _ToBeDoneState();
}

class _ToBeDoneState extends State<ToBeDone> {
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
              child: Text(
                "Add todos",
                style: TextStyle(color: Colors.grey),
              ),
            );
          } else {
            var todoss = snapshot.data
                    ?.where((element) => element.done == false)
                    .toList() ??
                [];
            if (todoss.isEmpty) {
              return const Center(
                child: Text(
                  "Empty",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Cardd(
                    note: todoss[index],
                    Ico: const FaIcon(FontAwesomeIcons.square),
                  );
                },
                itemCount: todoss.length,
              );
            }
          }
        });
  }
}
