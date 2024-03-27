import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/todo.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.icon});
  final Todo note;
  final FaIcon icon;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoList>(context, listen: false);
    return Dismissible(
      key: ValueKey(note.date),
      onDismissed: ((direction) {
        provider.removeItem(note);
      }),
      child: Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListTile(
            leading: Text(note.note),
            trailing: IconButton(
                icon: icon,
                onPressed: () {
                  provider.checkItem(note);
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
