import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/models/reminders/reminder.dart';
import 'package:ios_reminders/services/database_service.dart';
import 'package:provider/provider.dart';

import '../config/custom_theme.dart';
import '../models/todo_list/todo_list.dart';
import 'add_list/add_list_screen.dart';
import 'add_reminder/add_reminder_screen.dart';
import 'auth/authenticate_screen.dart';
import 'home/home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final customTheme = Provider.of<CustomTheme>(context);

    return MultiProvider(
      providers: [
        StreamProvider<List<TodoList>>.value(
          initialData: const [],
          value: user != null
              ? DatabaseService(uid: user.uid).todoListStream()
              : null,
        ),
        StreamProvider<List<Reminder>>.value(
          value: user != null
              ? DatabaseService(uid: user.uid).remindersStream()
              : null,
          initialData: const [],
        ),
      ],
      child: MaterialApp(
        routes: {
          '/home': (context) => const HomeScreen(),
          '/addList': (context) => const AddListScreen(),
          '/addReminder': (context) => const AddReminderScreen(),
        },
        home: user != null ? const HomeScreen() : const HomeScreen(),
        theme: customTheme.lightTheme,
        darkTheme: customTheme.darkTheme,
        themeMode: customTheme.currentTheme(),
      ),
    );
  }
}
