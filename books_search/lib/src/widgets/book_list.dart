import 'package:flutter/material.dart';
import 'package:it_book/src/models/book.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  final Function(int index) onListItemTap;
  final String title;

  const BookList({
    Key? key,
    required this.books,
    required this.onListItemTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 8),
            itemCount: books.length,
            itemBuilder: (context, index) => Card(
              elevation: 5,
              child: ListTile(
                onTap: () => onListItemTap(index),
                title: Text(books[index].title),
                subtitle: Text(books[index].subtitle),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
