import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/card.dart';
import 'package:provider/provider.dart';
import 'package:notebook/todo.dart';

class ToBeDone extends StatefulWidget {
  const ToBeDone({super.key});

  @override
  State<ToBeDone> createState() => _ToBeDoneState();
}

class _ToBeDoneState extends State<ToBeDone> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoList>(context, listen: true);

    return ListView.builder(
      itemBuilder: (context, index) {
        return NoteCard(
          note: provider.toBeDone[index],
          icon: const FaIcon(FontAwesomeIcons.square),
        );
      },
      itemCount: provider.toBeDone.length,
    );
  }
}
