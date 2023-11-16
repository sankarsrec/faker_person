import 'package:dartz/dartz.dart';

import '../../data/data_sources/persons_data_source.dart';
import '../entities/person_entity.dart';
import '../entities/server_response_entity.dart';

abstract class PersonsRepository {
  const PersonsRepository({
    required this.personsDataSource,
  });

  final PersonsDataSource personsDataSource;

  Future<Either<ServerResponseEntity, List<PersonEntity>>> getPersons();
}
