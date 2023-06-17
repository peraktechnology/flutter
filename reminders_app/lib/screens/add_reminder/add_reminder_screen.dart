import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ios_reminders/models/category/category_collection.dart';
import 'package:ios_reminders/models/common/helpers/helpers.dart' as helpers;
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:ios_reminders/screens/add_reminder/select_reminder_category_screen.dart';
import 'package:ios_reminders/screens/add_reminder/select_reminder_list_screen.dart';
import 'package:ios_reminders/services/database_service.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/category_icon.dart';
import '../../models/category/category.dart';
import '../../models/reminders/reminder.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({Key? key}) : super(key: key);

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _notesTextController = TextEditingController();

  String _title = '';
  TodoList? _selectedList;
  Category _selectedCategory = CategoryCollection().categories[0];
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _titleTextController.addListener(() {
      setState(() {
        _title = _titleTextController.text;
      });
    });
  }

  _updateSelectedList(TodoList todoList) {
    setState(() {
      _selectedList = todoList;
    });
  }

  _updateSelectedCategory(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleTextController.dispose();
    _notesTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _todoLists = Provider.of<List<TodoList>>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Reminder'),
        actions: [
          TextButton(
            onPressed: _title.isEmpty ||
                    _selectedDate == null ||
                    _selectedTime == null
                ? null
                : () async {
                    print('add to database');
                    _selectedList ??= _todoLists.first;
                    final user = Provider.of<User?>(context, listen: false);

                    var newReminder = Reminder(
                      id: null,
                      title: _titleTextController.text,
                      categoryId: _selectedCategory.id,
                      dueDate: _selectedDate!.millisecondsSinceEpoch,
                      dueTime: {
                        'hour': _selectedTime!.hour,
                        'minute': _selectedTime!.minute,
                      },
                      notes: _notesTextController.text,
                      list: _selectedList!.toJson(),
                    );

                    try {
                      DatabaseService(uid: user!.uid)
                          .addReminder(reminder: newReminder);
                      Navigator.pop(context);
                      helpers.showSnackBar(context, 'Reminder Added');
                    } catch (e) {
                      helpers.showSnackBar(context, 'Unable to add reminder');
                    }
                  },
            child: const Text(
              'Add',
              style: TextStyle(
                  //color: _listName.isNotEmpty ? Colors.blueAccent : Colors.grey,
                  ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                children: [
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _titleTextController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 100,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _notesTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Notes',
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  tileColor: Theme.of(context).cardColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectReminderListScreen(
                          todoLists: _todoLists,
                          selectListCallback: _updateSelectedList,
                          selectedList: _selectedList != null
                              ? _selectedList!
                              : _todoLists.first,
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  leading: Text(
                    'List',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CategoryIcon(
                        bgColor: Colors.blueAccent,
                        iconData: Icons.calendar_today,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(_selectedList != null
                          ? _selectedList!.title
                          : _todoLists.first.title),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  tileColor: Theme.of(context).cardColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectReminderCategoryScreen(
                          selectedCategory: _selectedCategory,
                          selectCategoryCallback: _updateSelectedCategory,
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  leading: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                        bgColor: _selectedCategory.icon.bgColor,
                        iconData: _selectedCategory.icon.iconData,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(_selectedCategory.name),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  tileColor: Theme.of(context).cardColor,
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (pickedDate != null) {
                      print(pickedDate);
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    } else {
                      print('no date was picked');
                    }
                  },
                  leading: Text(
                    'Date',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                        bgColor: Colors.red.shade300,
                        iconData: CupertinoIcons.calendar_badge_plus,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(_selectedDate != null
                          ? DateFormat.yMMMd().format(_selectedDate!).toString()
                          : 'Select Date'),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  tileColor: Theme.of(context).cardColor,
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      print(pickedTime);
                      setState(() {
                        _selectedTime = pickedTime;
                      });
                    } else {
                      print('no time was selected');
                    }
                  },
                  leading: Text(
                    'Time',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                        bgColor: Colors.red.shade300,
                        iconData: CupertinoIcons.time,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(_selectedTime != null
                          ? _selectedTime!.format(context).toString()
                          : 'Select Time'),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
