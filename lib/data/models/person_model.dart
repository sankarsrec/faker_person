import '../../domain/entities/person_entity.dart';
import 'address_model.dart';

class PersonModel extends PersonEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String birthday;
  final String gender;
  final AddressModel address;
  final String website;
  final String image;

  PersonModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.address,
    required this.website,
    required this.image,
  }) : super(
          id: id,
          fullName: '$firstName $lastName',
          email: email,
          phone: phone,
          birthday: birthday,
          gender: gender,
          website: website,
          image: image,
          fullAddress:
              '${address.buildingNumber}, ${address.streetName}, ${address.street}, ${address.city} - ${address.zipcode}, ${address.country}',
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      email: json['email'],
      phone: json['phone'],
      birthday: json['birthday'],
      gender: json['gender'],
      address: AddressModel.fromJson(json['address']),
      website: json['website'],
      image: json['image'],
    );
  }
}
