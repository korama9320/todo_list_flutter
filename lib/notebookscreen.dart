import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/card.dart';
import 'package:provider/provider.dart';
import 'package:notebook/todo.dart';

class Notebook extends StatefulWidget {
  const Notebook({super.key});

  @override
  State<Notebook> createState() => _NotebookState();
}

class _NotebookState extends State<Notebook> {
  List<Widget> dose = [const ToBeDone(), const Done()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(20),
              child: FaIcon(FontAwesomeIcons.ellipsisVertical),
            ),
          ],
          title:
              index == 0 ? const Text("To-Do List") : const Text("Done-List"),
          bottom: TabBar(
              onTap: ((value) {
                setState(() {
                  index = value;
                });
              }),
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FaIcon(FontAwesomeIcons.list),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FaIcon(FontAwesomeIcons.listCheck),
                )
              ]),
        ),
        floatingActionButton: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.circlePlus,
            color: Color.fromRGBO(0, 150, 136, 1),
            size: 40,
          ),
          onPressed: (() {
            Navigator.of(context).pushNamed("/add");
          }),
        ),
        body: dose[index]);
  }
}

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
        return Cardd(note: provider.tobedonetodos[index]);
      },
      itemCount: provider.tobedonetodos.length,
    );
  }
}

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
        children:
            provider.donetodos.map((element) => Cardd(note: element)).toList());
  }
}
