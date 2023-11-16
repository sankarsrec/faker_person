import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/person_entity.dart';
import '../../../../domain/use_cases/persons_use_case.dart';

part 'persons_state.dart';

enum ApiStatus { idle, loading, error, success }

class PersonsCubit extends Cubit<PersonsState> {
  PersonsCubit({
    required this.personsUseCase,
  }) : super(const PersonsState());

  final PersonsUseCase personsUseCase;

  Future<void> fetchPersons({
    bool isViewMore = false,
  }) async {
    if ((!isViewMore || state.loadedCount < 40) &&
        state.fetchPersonsStatus != ApiStatus.loading &&
        state.loadMorePersonsStatus != ApiStatus.loading) {
      if (isViewMore) {
        emit(
          state.copyWith(
            loadMorePersonsStatus: ApiStatus.loading,
          ),
        );
      } else {
        emit(
          state.copyWith(
            fetchPersonsStatus: ApiStatus.loading,
            isLoadMoreAvailable: false,
            loadedPersonsList: [],
            loadedCount: 0,
          ),
        );
      }

      try {
        final response = await personsUseCase.getPersons();

        response.fold(
          (failure) {
            emit(
              state.copyWith(
                fetchPersonsStatus: ApiStatus.error,
                loadMorePersonsStatus: ApiStatus.error,
                loadedPersonsList: [],
                loadedCount: 0,
                isLoadMoreAvailable: false,
              ),
            );
          },
          (success) {
            final List<PersonEntity> newPersonsList =
                List.from(state.loadedPersonsList);
            newPersonsList.addAll(success);

            final int newLoadedCount = newPersonsList.length;

            emit(
              state.copyWith(
                fetchPersonsStatus: ApiStatus.success,
                loadMorePersonsStatus: ApiStatus.success,
                loadedPersonsList: newPersonsList,
                loadedCount: newPersonsList.length,
                isLoadMoreAvailable: newLoadedCount < 40,
              ),
            );
          },
        );
      } catch (exception) {
        emit(
          state.copyWith(
            fetchPersonsStatus: ApiStatus.error,
            loadMorePersonsStatus: ApiStatus.error,
            loadedPersonsList: [],
            loadedCount: 0,
            isLoadMoreAvailable: false,
          ),
        );
      }
    }
  }
}
