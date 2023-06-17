import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:it_book/src/models/book.dart';

class PagedBookList extends StatefulWidget {
  final PagingController<int, Book> controller;
  final Function(int index) onListItemTap;
  final String title;

  const PagedBookList({
    Key? key,
    required this.controller,
    required this.onListItemTap,
    required this.title,
  }) : super(key: key);

  @override
  State<PagedBookList> createState() => _PagedBookListState();
}

class _PagedBookListState extends State<PagedBookList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: PagedListView<int, Book>(
            pagingController: widget.controller,
            builderDelegate: PagedChildBuilderDelegate<Book>(
              itemBuilder: (context, item, index) => Card(
                elevation: 5,
                child: ListTile(
                  onTap: () => widget.onListItemTap(index),
                  title: Text(item.title),
                  subtitle: Text(item.subtitle),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
