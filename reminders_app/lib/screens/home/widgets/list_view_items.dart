import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category/category_collection.dart';

const listViewHeight = 70.0;

class ListViewItems extends StatefulWidget {
  final CategoryCollection categoryCollection;
  const ListViewItems({required this.categoryCollection});

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          widget.categoryCollection.categories.length * (listViewHeight + 1),
      child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }

            final item = widget.categoryCollection.removeItem(oldIndex);
            setState(() {
              widget.categoryCollection.insert(newIndex, item);
            });
          },
          children: widget.categoryCollection.categories
              .map(
                (category) => SizedBox(
                  key: UniqueKey(),
                  height: listViewHeight,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        category.toggleCheckbox();
                      });
                    },
                    tileColor: Theme.of(context).cardColor,
                    leading: Container(
                      decoration: BoxDecoration(
                        color: category.isChecked
                            ? Colors.blueAccent
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: category.isChecked
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      ),
                      child: Icon(Icons.check,
                          color: category.isChecked
                              ? Colors.white
                              : Colors.transparent),
                    ),
                    title: Row(
                      children: [
                        category.icon,
                        const SizedBox(width: 10),
                        Text(category.name),
                      ],
                    ),
                    trailing: const Icon(Icons.reorder),
                  ),
                ),
              )
              .toList()),
    );
  }
}
