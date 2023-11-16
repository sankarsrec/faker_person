import 'package:flutter/material.dart';

import '../../../../domain/entities/person_entity.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/image_widget.dart';
import '../../person_detail/person_detail_screen.dart';

class PersonListItem extends StatelessWidget {
  const PersonListItem({
    super.key,
    required this.personData,
  });

  final PersonEntity personData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: InkWell(
        onTap: () => _openPersonDetailScreen(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.teal.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ImageWidget(
                          imagePath: personData.image,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            personData.fullName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      personData.email,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openPersonDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonDetailScreen(
          personData: personData,
        ),
      ),
    );
  }
}
