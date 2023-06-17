import 'package:it_book/src/models/book.dart';

class SearchBookResult {
  final int total;
  final int? page;
  final List<Book> books;

  SearchBookResult({
    required this.total,
    required this.page,
    required this.books,
  });

  factory SearchBookResult.fromMap(Map<String, dynamic> map) {
    return SearchBookResult(
      total: int.parse(map['total']),
      page: map.containsKey('page') ? int.parse(map['page']) : null,
      books: map['books'].map<Book>((json) => Book.fromMap(json)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'page': page,
      'books': books.map((book) => book.toMap()),
    };
  }
}
