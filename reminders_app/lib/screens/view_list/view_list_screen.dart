import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/common/widgets/dismissible_background.dart';
import 'package:ios_reminders/models/common/helpers/helpers.dart' as helpers;
import 'package:ios_reminders/services/database_service.dart';
import 'package:provider/provider.dart';

import '../../models/reminders/reminder.dart';
import '../../models/todo_list/todo_list.dart';

class ViewListScreen extends StatelessWidget {
  final TodoList todoList;

  const ViewListScreen({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allReminders = Provider.of<List<Reminder>>(context);
    final reminderForList = allReminders
        .where((reminder) => reminder.list['id'] == todoList.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(todoList.title),
      ),
      body: ListView.builder(
        itemCount: reminderForList.length,
        itemBuilder: (context, index) {
          final reminder = reminderForList[index];
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: const DismissibleBackground(),
            onDismissed: (direction) async {
              final user = Provider.of<User?>(context, listen: false);

              try {
                DatabaseService(uid: user!.uid)
                    .deleteReminder(reminder, todoList);
                helpers.showSnackBar(context, 'Reminder Deleted');
              } catch (e) {
                helpers.showSnackBar(context, 'Unable To delete reminder');
              }
            },
            child: Card(
              child: ListTile(
                title: Text(reminder.title),
                subtitle: reminder.notes != null ? Text(reminder.notes!) : null,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      helpers.formatDate(reminder.dueDate),
                    ),
                    Text(
                      helpers.formatTime(
                        context,
                        reminder.dueTime['hour'],
                        reminder.dueTime['minute'],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
