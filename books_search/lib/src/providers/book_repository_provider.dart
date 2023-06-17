import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:it_book/src/repositories/it_book_repository.dart';

final bookRepositoryProvider =
    Provider<ItBookRepository>((ref) => ItBookRepository());
