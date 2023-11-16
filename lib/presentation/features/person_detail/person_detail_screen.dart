import 'widgets/detail_item.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/person_entity.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/image_widget.dart';

class PersonDetailScreen extends StatelessWidget {
  const PersonDetailScreen({
    super.key,
    required this.personData,
  });

  final PersonEntity personData;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: personData.fullName,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageWidget(
                  imagePath: personData.image,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: DetailItem(detail: personData.fullName),
                ),
              ],
            ),
            DetailItem(detail: personData.email),
            DetailItem(detail: personData.phone),
            DetailItem(detail: personData.gender),
            DetailItem(detail: personData.birthday),
            DetailItem(detail: personData.website),
            DetailItem(detail: personData.fullAddress),
          ],
        ),
      ),
    );
  }
}
