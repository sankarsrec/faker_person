part of 'persons_cubit.dart';

class PersonsState extends Equatable {
  const PersonsState({
    this.fetchPersonsStatus = ApiStatus.idle,
    this.loadedPersonsList = const [],
    this.loadedCount = 0,
    this.loadMorePersonsStatus = ApiStatus.idle,
    this.isLoadMoreAvailable = false,
  });

  final ApiStatus fetchPersonsStatus;
  final List<PersonEntity> loadedPersonsList;
  final int loadedCount;
  final ApiStatus loadMorePersonsStatus;
  final bool isLoadMoreAvailable;

  PersonsState copyWith({
    ApiStatus? fetchPersonsStatus,
    List<PersonEntity>? loadedPersonsList,
    int? loadedCount,
    ApiStatus? loadMorePersonsStatus,
    bool? isLoadMoreAvailable,
  }) {
    return PersonsState(
      fetchPersonsStatus: fetchPersonsStatus ?? ApiStatus.idle,
      loadedPersonsList: loadedPersonsList ?? this.loadedPersonsList,
      loadedCount: loadedCount ?? this.loadedCount,
      loadMorePersonsStatus: loadMorePersonsStatus ?? ApiStatus.idle,
      isLoadMoreAvailable: isLoadMoreAvailable ?? this.isLoadMoreAvailable,
    );
  }

  @override
  List<Object?> get props => [
        fetchPersonsStatus,
        loadedPersonsList,
        loadedCount,
        loadMorePersonsStatus,
        isLoadMoreAvailable,
      ];
}
