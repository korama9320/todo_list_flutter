import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/main.dart';
import 'package:notebook/todo.dart';
// import 'package:provider/provider.dart';

class Cardd extends StatelessWidget {
  Cardd({required this.note, required this.Ico});
  Todo note;
  FaIcon Ico;
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<TodoList>(context, listen: false);
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: ValueKey(note.date),
      onDismissed: ((direction) {
        // provider.removeitem(note);
        objectBox.deleteTodo(note.id);
      }),
      child: Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListTile(
            leading: Text(note.note),
            trailing: IconButton(
                icon: Ico,
                onPressed: () {
                  // provider.checkitem(note);
                  var up = objectBox.getTodo(note.id);
                  up!.done = !up.done;
                  objectBox.insertTodo(up);
                }),
          ),
          Text(
            note.date.toString(),
            textAlign: TextAlign.start,
          ),
        ]),
      ),
    );
  }
}
