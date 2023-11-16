import 'package:flutter/material.dart';

import 'default_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          imagePath,
          loadingBuilder: (context, child, loadingProgress) =>
              const DefaultImage(),
          errorBuilder: (context, error, stackTrace) => const DefaultImage(),
        ),
      ),
    );
  }
}
