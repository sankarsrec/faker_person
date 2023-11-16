import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_utils.dart';
import '../../widgets/custom_scaffold.dart';
import 'cubit/persons_cubit.dart';
import 'widgets/persons_list_view.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({super.key});

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  final bool isMobile = AppUtils.isMobile();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    ///Load Initial
    loadPersons();

    if (isMobile) {
      ///Load on Scroll
      scrollController.addListener(() {
        loadMorePersons();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonsCubit, PersonsState>(
      bloc: context.read<PersonsCubit>(),
      builder: (context, state) {
        return CustomScaffold(
          title: AppConstants.persons,
          isLoading: state.fetchPersonsStatus == ApiStatus.loading,
          appBarActions: isMobile
              ? null
              : [
                  IconButton(
                    onPressed: () => loadPersons(),
                    icon: const Icon(
                      Icons.refresh,
                      color: AppColors.white,
                    ),
                  ),
                ],
          body: !isMobile
              ? PersonsListView(
                  loadedPersonsList: state.loadedPersonsList,
                  canLoadMore: state.isLoadMoreAvailable,
                )
              : RefreshIndicator(
                  onRefresh: () {
                    return loadPersons();
                  },
                  child: PersonsListView(
                    scrollController: scrollController,
                    loadedPersonsList: state.loadedPersonsList,
                    canLoadMore: state.isLoadMoreAvailable,
                  ),
                ),
        );
      },
    );
  }

  Future<void> loadPersons() async {
    context.read<PersonsCubit>().fetchPersons();
  }

  void loadMorePersons() {
    context.read<PersonsCubit>().fetchPersons(isViewMore: true);
  }
}
