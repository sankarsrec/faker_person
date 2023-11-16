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
    const int pageCount = 10;

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
      final response = await personsUseCase.getPersons(
        count: state.loadedCount + pageCount,
      );

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              fetchPersonsStatus: ApiStatus.error,
              loadedPersonsList: [],
              loadedCount: 0,
              isLoadMoreAvailable: false,
            ),
          );
        },
        (success) {
          final int newViewedCount = state.loadedCount + pageCount;

          emit(
            state.copyWith(
              fetchPersonsStatus: ApiStatus.success,
              loadedPersonsList: success,
              loadedCount: success.length,
              isLoadMoreAvailable: newViewedCount <= success.length,
            ),
          );
        },
      );
    } catch (exception) {
      emit(
        state.copyWith(
          fetchPersonsStatus: ApiStatus.error,
          loadedPersonsList: [],
          loadedCount: 0,
          isLoadMoreAvailable: false,
        ),
      );
    }
  }
}
