// import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Todo {
  num id = 0;
  String note;
  bool done = false;
  DateTime date = DateTime.now();
  Todo(this.note, this.id);
}
// factory Todo.fromJson(Map<String,dynamic> jsonData){
//   return Todo(
//     id:jsonData["id"],
// note:jsonData["note"],
// done:false,
// date:jsonData["date"]
//   );
// }

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

  // void getpref() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();

  //   var todooref = pref.getStringList("todo");
  //   if (todooref == null) {
  //     _todolist = [];
  //   } else {
  //     // List<Todo> todoo = Todo.decode(todooref);
  //   }
  // }
}
