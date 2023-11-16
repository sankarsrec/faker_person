import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'custom_loader.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.body,
    this.title,
    this.appBarActions,
    this.isLoading = false,
  }) : super(key: key);

  final Widget body;
  final String? title;
  final List<Widget>? appBarActions;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          title ?? '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
        ),
        leading: Navigator.canPop(context)
            ? const BackButton(
                color: AppColors.white,
              )
            : null,
        backgroundColor: AppColors.teal,
        actions: appBarActions,
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              child: body,
            ),
            if (isLoading) const CustomLoader(),
          ],
        ),
      ),
    );
  }
}
