import 'package:dartz/dartz.dart';

import '../entities/person_entity.dart';
import '../entities/server_response_entity.dart';
import '../repositories/persons_repository.dart';

class PersonsUseCase {
  const PersonsUseCase({
    required this.personsRepository,
  });

  final PersonsRepository personsRepository;

  Future<Either<ServerResponseEntity, List<PersonEntity>>> getPersons({
    required int count,
  }) async {
    return await personsRepository.getPersons();
  }
}
