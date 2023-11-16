import 'person_model.dart';

class PersonsResponseModel {
  String status;
  int code;
  int total;
  List<PersonModel> data;

  PersonsResponseModel({
    required this.status,
    required this.code,
    required this.total,
    required this.data,
  });

  factory PersonsResponseModel.fromJson(Map<String, dynamic> json) {
    return PersonsResponseModel(
      status: json['status'],
      code: json['code'],
      total: json['total'],
      data: List<PersonModel>.from(
        json['data'].map(
          (person) => PersonModel.fromJson(person),
        ),
      ),
    );
  }
}
