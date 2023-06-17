import 'package:go_router/go_router.dart';
import 'package:it_book/src/screens/book_detail_screen.dart';
import 'package:it_book/src/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'bookDetail',
      path: '/:bookIsbn',
      builder: (context, state) =>
          BookDetailScreen(isbn: state.params['bookIsbn']),
    ),
  ],
);
