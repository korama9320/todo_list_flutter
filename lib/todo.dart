import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Todo {
  num id = 0;
  String note;
  bool done = false;
  String date = DateTime.now().toString();
  Todo(this.note, this.id);
}

class TodoList extends ChangeNotifier {
  List<Todo> _todoList = [];
  void addNotes(String note) {
    _todoList.add(Todo(note, _todoList.length));
    notifyListeners();
  }

  List<Todo> get todo {
    return [..._todoList];
  }

  List<Todo> get done {
    return _todoList.where((element) => element.done == true).toList();
  }

  List<Todo> get toBeDone {
    return _todoList.where((element) => element.done == false).toList();
  }

  void checkItem(Todo note) {
    int x = _todoList.indexWhere((element) => element.date == note.date);
    _todoList[x].done = !note.done;
    notifyListeners();
  }

  void removeItem(Todo note) {
    _todoList.removeWhere((element) => element.date == note.date);
    notifyListeners();
  }
}
