import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook/objectbox.dart';
import 'package:notebook/tobedone.dart';
import 'done.dart';

late ObjectBox objectBox;

class Notebook extends StatefulWidget {
  const Notebook({super.key});

  @override
  State<Notebook> createState() => _NotebookState();
}

class _NotebookState extends State<Notebook> {
  List<Widget> dose = [ToBeDone(), Done()];
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
          color: Colors.black,
          icon: const Center(
            child: FaIcon(
              FontAwesomeIcons.circlePlus,
              color: Color.fromRGBO(0, 150, 136, 1),
              size: 45,
            ),
          ),
          onPressed: (() {
            Navigator.of(context).pushNamed("/add");
          }),
        ),
        body: dose[index]);
  }
}
