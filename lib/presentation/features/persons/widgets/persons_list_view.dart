import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/person_entity.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_utils.dart';
import '../../../widgets/custom_text_button.dart';
import '../cubit/persons_cubit.dart';
import 'person_list_item.dart';

class PersonsListView extends StatelessWidget {
  const PersonsListView({
    super.key,
    required this.loadedPersonsList,
    this.scrollController,
    this.canLoadMore = false,
  });

  final ScrollController? scrollController;
  final List<PersonEntity> loadedPersonsList;
  final bool canLoadMore;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppUtils.isMobile();

    return ListView.builder(
      controller: scrollController,
      itemCount: loadedPersonsList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            PersonListItem(
              personData: loadedPersonsList[index],
            ),
            if (index == loadedPersonsList.length - 1)
              !canLoadMore
                  ? const Text(
                      AppConstants.noMoreData,
                    )
                  : (!isMobile
                      ? CustomTextButton(
                          buttonText: AppConstants.loadMore,
                          onPressed: () => loadMorePersons(context),
                        )
                      : const SizedBox.shrink()),
          ],
        );
      },
    );
  }

  void loadMorePersons(BuildContext context) {
    context.read<PersonsCubit>().fetchPersons(isViewMore: true);
  }
}
