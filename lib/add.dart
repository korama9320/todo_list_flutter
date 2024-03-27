import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/todo.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final formKey = GlobalKey<FormState>();
  String text = "";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add-Some-Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const FaIcon(
                FontAwesomeIcons.penFancy,
                size: 100,
                color: Colors.blueGrey,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Note")),
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    provider.addNotes(text);
                  },
                  child: const Text("Add"))
            ])),
      ),
    );
  }
}
