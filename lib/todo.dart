// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Todo {
  @Id()
  int id;
  String note;
  bool done = false;
  String date = DateTime.now().toString();
  Todo({required this.note, this.id = 0, this.done = false});
}

// class TodoList extends ChangeNotifier {
//   List<Todo> _todolist = [];
//   void addnotes(String note) {
//     _todolist.add(Todo(note: note));
//     notifyListeners();
//   }

//   List<Todo> get todos {
//     return [..._todolist];
//   }

//   List<Todo> get donetodos {
//     return _todolist.where((element) => element.done == true).toList();
//   }

//   List<Todo> get tobedonetodos {
//     return _todolist.where((element) => element.done == false).toList();
//   }

//   void checkitem(Todo note) {
//     int x = _todolist.indexWhere((element) => element.date == note.date);
//     _todolist[x].done = !note.done;
//     notifyListeners();
//   }

//   void removeitem(Todo note) {
//     _todolist.removeWhere((element) => element.date == note.date);
//     notifyListeners();
//   }
// }
