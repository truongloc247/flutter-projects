import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "firstName")
  String firstName;

  @JsonKey(name: "lastName")
  String lastName;

  @JsonKey(name: "maidenName")
  String maidenName;

  @JsonKey(name: "age")
  num age;

  @JsonKey(name: "gender")
  String gender;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "phone")
  String phone;

  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "birthDate")
  String birthDate;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "university")
  String uni;

  @JsonKey(name: "height")
  num height;

  @JsonKey(name: "weight")
  num weight;

  @JsonKey(name: "eyeColor")
  String eyeColor;

  @JsonKey(name: "bloodGroup")
  String bloodGroup;

  @JsonKey(name: "role")
  String role;

  User({
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.birthDate,
    required this.image,
    required this.uni,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.bloodGroup,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
