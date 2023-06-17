import 'package:flutter/material.dart';
import 'package:ios_reminders/screens/add_list/add_list_screen.dart';
import 'package:ios_reminders/screens/add_reminder/add_reminder_screen.dart';
import 'package:provider/provider.dart';

import '../../../models/todo_list/todo_list.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoLists = Provider.of<List<TodoList>>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: todoLists.isNotEmpty
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddReminderScreen(),
                        fullscreenDialog: true,
                      ),
                    );
                  }
                : null,
            icon: const Icon(Icons.add_circle),
            label: const Text('New Reminder'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddListScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Text('Add List'),
          ),
        ],
      ),
    );
  }
}
