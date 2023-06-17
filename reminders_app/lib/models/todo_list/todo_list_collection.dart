import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';

class TodoListCollection with ChangeNotifier {
  final List<TodoList> _todoLists = [];

  UnmodifiableListView<TodoList> get todoLists =>
      UnmodifiableListView(_todoLists);

  addTodoList(TodoList todoList) {
    _todoLists.add(todoList);
    notifyListeners();
  }

  removeTodoList(TodoList todoList) {
    _todoLists.removeWhere((element) => element.id == todoList.id);
    notifyListeners();
  }
}
