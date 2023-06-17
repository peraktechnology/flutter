import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:it_book/generated/l10n.dart';
import 'package:it_book/src/layouts/main_layout.dart';
import 'package:it_book/src/models/book_detail.dart';
import 'package:it_book/src/providers/book_repository_provider.dart';
import 'package:it_book/src/widgets/network_image_with_loader.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailScreen extends ConsumerStatefulWidget {
  final String? isbn;

  const BookDetailScreen({Key? key, this.isbn}) : super(key: key);

  @override
  ConsumerState<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends ConsumerState<BookDetailScreen> {
  String? error;
  BookDetail? book;

  void getBook() async {
    setState(() {
      error = null;
    });

    if (widget.isbn == null) {
      context.goNamed('home');
      return;
    }

    try {
      final result =
          await ref.read(bookRepositoryProvider).getBookByIsbn(widget.isbn!);

      setState(() {
        book = result;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  void openWeb(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).failedToOpenUrl)),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getBook();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Builder(builder: (context) {
        if (error != null) {
          return Text(error!);
        }
        if (book != null) {
          return ListView(
            children: <Widget>[
              NetworkImageWithLoader(url: book!.image),
              const SizedBox(height: 16),
              Text(
                book!.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                book!.subtitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              Text(book!.desc.replaceAll('&#039;', "'")),
              const SizedBox(height: 16),
              Text(book!.price,
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => openWeb(book!.url),
                child: Text(S.of(context).buyOnPage),
              ),
            ],
          );
        }
        return const SizedBox.expand();
      }),
    );
  }
}
