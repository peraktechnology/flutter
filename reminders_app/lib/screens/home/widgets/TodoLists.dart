import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/models/common/helpers/helpers.dart' as helpers;
import 'package:ios_reminders/screens/view_list/view_list_screen.dart';
import 'package:ios_reminders/services/database_service.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/category_icon.dart';
import '../../../common/widgets/dismissible_background.dart';
import '../../../models/common/custom_color_collection.dart';
import '../../../models/common/custom_icon_collection.dart';
import '../../../models/todo_list/todo_list.dart';

class TodoLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoLists = Provider.of<List<TodoList>>(context);
    final user = Provider.of<User?>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Lists',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: todoLists.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                    try {
                      await DatabaseService(uid: user!.uid)
                          .deleteTodoList(todoLists[index]);
                      helpers.showSnackBar(context, 'List Deleted');
                    } catch (e) {
                      helpers.showSnackBar(context, 'Unable to delete List');
                    }
                  },
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: const DismissibleBackground(),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      onTap: todoLists[index].reminderCount > 0
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewListScreen(
                                    todoList: todoLists[index],
                                  ),
                                ),
                              );
                            }
                          : null,
                      leading: CategoryIcon(
                        bgColor: (CustomColorCollection()
                            .findColorById(todoLists[index].icon['color'])
                            .color),
                        iconData: (CustomIconCollection()
                                .findIconById(todoLists[index].icon['id']))
                            .icon,
                      ),
                      trailing: Text(
                        todoLists[index].reminderCount.toString(),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      title: Text(todoLists[index].title),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
