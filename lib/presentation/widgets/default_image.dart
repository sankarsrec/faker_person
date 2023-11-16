import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.grey,
      ),
    );
  }
}
