import 'package:ecommercefirebase/featrue/profile/domain/entities/profile_entitiey.dart';

class ProfileModel extends ProfileEntitiey {
  ProfileModel(
      {required super.name,
      required super.email,
      required super.phone,
      required super.image,
      required super.age});
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        age: json['age'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'age': age
      };
}
