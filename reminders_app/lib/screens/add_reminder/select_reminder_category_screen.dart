import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category/category_collection.dart';

import '../../models/category/category.dart';

class SelectReminderCategoryScreen extends StatelessWidget {
  final Category selectedCategory;
  final Function(Category) selectCategoryCallback;

  const SelectReminderCategoryScreen({
    Key? key,
    required this.selectedCategory,
    required this.selectCategoryCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = CategoryCollection().categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          if (item.id == 'all') {
            return Container();
          }
          return ListTile(
            onTap: () {
              selectCategoryCallback(item);
              Navigator.pop(context);
            },
            title: Text(item.name),
            trailing: item.name == selectedCategory.name
                ? const Icon(Icons.check)
                : null,
          );
        },
      ),
    );
  }
}
