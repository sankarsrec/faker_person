import 'package:dartz/dartz.dart';

import '../../domain/entities/person_entity.dart';
import '../../domain/entities/server_response_entity.dart';
import '../../domain/repositories/persons_repository.dart';

class PersonsRepositoryImpl extends PersonsRepository {
  PersonsRepositoryImpl({required super.personsDataSource});

  @override
  Future<Either<ServerResponseEntity, List<PersonEntity>>> getPersons() async {
    return personsDataSource.getPersons();
  }
}
