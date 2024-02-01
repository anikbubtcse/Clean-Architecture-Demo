import 'package:clean_architecture_demo/features/users_info/domain/entities/users_entity.dart';

class UsersModel extends UsersEntity {
  UsersModel(
      {required int id,
      required String name,
      required String username,
      required String email,
      required AddressModel address,
      required String phone,
      required String website,
      required CompanyModel company})
      : super(
            id: id,
            name: name,
            username: username,
            email: email,
            address: address,
            phone: phone,
            website: website,
            company: company);

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? 0,
        address: json["address"] != null
            ? AddressModel.fromJson(json["address"])
            : AddressModel.fromJson({}),
        phone: json["phone"] ?? '',
        website: json["website"] ?? '',
        company: json["company"] != null
            ? CompanyModel.fromJson(json["company"])
            : CompanyModel.fromJson({}),
      );
}

class AddressModel extends AddressEntity {
  AddressModel(
      {required String street,
      required String suite,
      required String city,
      required String zipcode,
      required GeoModel geo})
      : super(
            street: street,
            suite: suite,
            city: city,
            zipcode: zipcode,
            geo: geo);

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json["street"] ?? '',
        suite: json["suite"] ?? '',
        city: json["city"] ?? '',
        zipcode: json["zipcode"] ?? '',
        geo: json["geo"] != null
            ? GeoModel.fromJson(json["geo"])
            : GeoModel.fromJson({}),
      );
}

class CompanyModel extends CompanyEntity {
  CompanyModel({
    required String name,
    required String catchPhrase,
    required String bs,
  }) : super(name: name, catchPhrase: catchPhrase, bs: bs);

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"] ?? '',
        catchPhrase: json["catchPhrase"] ?? '',
        bs: json["bs"] ?? '',
      );
}

class GeoModel extends GeoEntity {
  GeoModel({required String lat, required String lng})
      : super(lat: lat, lng: lng);

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json["lat"] ?? '',
        lng: json["lng"] ?? '',
      );
}
