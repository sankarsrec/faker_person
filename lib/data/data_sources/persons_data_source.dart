import 'package:dartz/dartz.dart';

import '../../domain/entities/person_entity.dart';
import '../../domain/entities/server_response_entity.dart';
import '../core/api_constants.dart';
import '../core/api_services.dart';
import '../models/persons_response_model.dart';
import '../models/server_response_model.dart';

abstract class PersonsDataSource {
  Future<Either<ServerResponseEntity, List<PersonEntity>>> getPersons();
}

class PersonsDataSourceImpl implements PersonsDataSource {
  @override
  Future<Either<ServerResponseEntity, List<PersonEntity>>> getPersons() async {
    final response = await ApiServices.get(
      ApiConstants.persons,
    );

    if (response is ServerResponseModel) {
      return Left(response);
    } else {
      final personsResponse = PersonsResponseModel.fromJson(response ?? {});
      return Right(personsResponse.data);
    }
  }
}
