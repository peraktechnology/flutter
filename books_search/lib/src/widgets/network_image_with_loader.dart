import 'package:flutter/material.dart';

class NetworkImageWithLoader extends StatelessWidget {
  final String url;

  const NetworkImageWithLoader({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
