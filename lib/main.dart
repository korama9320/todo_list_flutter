import 'package:flutter/material.dart';
import 'package:notebook/add.dart';
import 'package:notebook/notebookscreen.dart';
import 'package:notebook/todo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoList(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.teal, primarySwatch: Colors.teal),
        routes: {
          "/": (context) =>
              (const DefaultTabController(length: 2, child: Notebook())),
          "/add": (context) => (const Addnote())
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
