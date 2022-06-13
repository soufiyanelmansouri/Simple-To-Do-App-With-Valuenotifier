import 'package:flutter/cupertino.dart';

import 'todo.dart';

class TodoController extends ValueNotifier<List<Todo>> {
  TodoController._init() : super([]);
  static final TodoController _instance = TodoController._init();
  factory TodoController() => _instance;

  // final List<Todo> _todos = [];
  List<Todo> get todos => value;

  int get length => value.length;

  // add todo to the list
  void addATodo(Todo todo) {
    value.add(todo);
    notifyListeners();
  }

// remove a todo from the list
  void removeATodo(Todo todo) {
    if (value.contains(todo)) {
      value.remove(todo);
    }
    notifyListeners();
  }

  // get a specific todo from the list
  Todo? getTodo(int index) => length > index ? value[index] : null;
}
