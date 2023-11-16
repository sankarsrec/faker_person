import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    Key? key,
    required this.body,
    this.title,
    this.appBarActions,
  }) : super(key: key);

  final Widget body;
  final String? title;
  final List<Widget>? appBarActions;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.title ?? '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        leading: Navigator.canPop(context)
            ? const BackButton(
                color: AppColors.black,
              )
            : null,
      ),
      body: SafeArea(
        child: widget.body,
      ),
    );
  }
}
