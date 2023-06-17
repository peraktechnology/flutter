import 'package:flutter/material.dart';

import '../../models/todo_list/todo_list.dart';

class SelectReminderListScreen extends StatelessWidget {
  final List<TodoList> todoLists;
  final TodoList selectedList;
  final Function(TodoList) selectListCallback;

  const SelectReminderListScreen({
    Key? key,
    required this.todoLists,
    required this.selectedList,
    required this.selectListCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select List'),
      ),
      body: ListView.builder(
        itemCount: todoLists.length,
        itemBuilder: (context, index) {
          final item = todoLists[index];
          return ListTile(
            onTap: () {
              selectListCallback(item);
              Navigator.pop(context);
            },
            title: Text(item.title),
            trailing: item.title == selectedList.title
                ? const Icon(Icons.check)
                : null,
          );
        },
      ),
    );
  }
}
