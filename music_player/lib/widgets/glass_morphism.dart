import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  const GlassBox({
    super.key,
    this.width,
    this.height,
    this.blur,
    this.opacity,
    this.child,
    required this.radius,
  });

  final double? width, height;
  final double? blur;
  final List<double>? opacity;
  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: width ?? 200,
        height: height ?? 200,
        child: Stack(
          children: [
            /// Backdrop Filter - Blur
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur ?? 0,
                sigmaY: blur ?? 0,
              ),
              child: Container(),
            ),

            /// Gradient Effect
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(.2),
                ),
                borderRadius: BorderRadius.circular(radius),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(opacity?[0] ?? .3),
                    Colors.white.withOpacity(opacity?[1] ?? .1),
                  ],
                ),
              ),
            ),

            /// Child
            if (child != null) Center(child: child!),
          ],
        ),
      ),
    );
  }
}

class GlassMorphismMusicTile extends StatelessWidget {
  /// Audio Information Widget with Glass Morphism UI
  const GlassMorphismMusicTile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GlassBox(
      width: size.width * .85,
      height: size.height * .09,
      blur: 5,
      radius: 12,
      opacity: const [.3, .1],
      child: ListTile(
        title: const Text(
          'Waiting For You!',
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
          ),
        ),
        subtitle: const Text(
          'Mono',
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        leading: const CircleAvatar(
          child: Text('T'),
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
