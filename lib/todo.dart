import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todo {
  num id = 0;
  String note;
  bool done = false;
  String date = DateTime.now().toString();
  Todo(this.note, this.id);
}

class TodoList extends ChangeNotifier {
  List<Todo> _todolist = [];
  void addnotes(String note) {
    _todolist.add(Todo(note, _todolist.length));
    notifyListeners();
  }

  List<Todo> get todos {
    return [..._todolist];
  }

  List<Todo> get donetodos {
    return _todolist.where((element) => element.done == true).toList();
  }

  List<Todo> get tobedonetodos {
    return _todolist.where((element) => element.done == false).toList();
  }

  void checkitem(Todo note) {
    int x = _todolist.indexWhere((element) => element.date == note.date);
    _todolist[x].done = !note.done;
    notifyListeners();
  }

  void removeitem(Todo note) {
    _todolist.removeWhere((element) => element.date == note.date);
    notifyListeners();
  }
}
