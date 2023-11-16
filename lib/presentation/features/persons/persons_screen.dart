import 'package:flutter/material.dart';

import '../../widgets/custom_scaffold.dart';

class PersonsScreen extends StatelessWidget {
  const PersonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Persons',
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${index + 1}'),
          );
        },
      ),
    );
  }
}
