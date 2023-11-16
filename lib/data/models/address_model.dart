class AddressModel {
  int id;
  String street;
  String streetName;
  String buildingNumber;
  String city;
  String zipcode;
  String country;
  String countyCode;
  double latitude;
  double longitude;

  AddressModel({
    required this.id,
    required this.street,
    required this.streetName,
    required this.buildingNumber,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.countyCode,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      street: json['street'],
      streetName: json['streetName'],
      buildingNumber: json['buildingNumber'],
      city: json['city'],
      zipcode: json['zipcode'],
      country: json['country'],
      countyCode: json['county_code'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
