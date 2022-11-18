import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/todo.dart';
import 'package:provider/provider.dart';

class Cardd extends StatelessWidget {
  Cardd({required this.note, required this.Ico});
  Todo note;
  FaIcon Ico;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoList>(context, listen: false);
    return Dismissible(
      key: ValueKey(note.date),
      onDismissed: ((direction) {
        provider.removeitem(note);
      }),
      child: Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListTile(
            leading: Text(note.note),
            trailing: IconButton(
                icon: Ico,
                onPressed: () {
                  provider.checkitem(note);
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
