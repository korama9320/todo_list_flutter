import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/card.dart';
import 'package:provider/provider.dart';
import 'package:notebook/todo.dart';

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoList>(context, listen: true);

    return ListView(
        children: provider.done
            .map((element) => NoteCard(
                  note: element,
                  icon: const FaIcon(FontAwesomeIcons.squareCheck),
                ))
            .toList());
  }
}
