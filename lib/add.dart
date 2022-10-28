import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/todo.dart';
import 'package:provider/provider.dart';

class Addnote extends StatefulWidget {
  const Addnote({super.key});

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  final formkey = GlobalKey<FormState>();
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
            key: formkey,
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
                    provider.addnotes(text);
                  },
                  child: const Text("Add"))
            ])),
      ),
    );
  }
}
