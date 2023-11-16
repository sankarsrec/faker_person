import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String birthday;
  final String gender;
  final String website;
  final String image;
  final String fullAddress;

  const PersonEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.website,
    required this.image,
    required this.fullAddress,
  });

  @override
  List<Object> get props => [
        id,
        fullName,
        email,
        phone,
        birthday,
        gender,
        website,
        image,
        fullAddress,
      ];
}
