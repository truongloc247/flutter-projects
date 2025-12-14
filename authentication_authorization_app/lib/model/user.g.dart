// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  maidenName: json['maidenName'] as String,
  age: json['age'] as num,
  gender: json['gender'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  username: json['username'] as String,
  birthDate: json['birthDate'] as String,
  image: json['image'] as String,
  uni: json['university'] as String,
  height: json['height'] as num,
  weight: json['weight'] as num,
  eyeColor: json['eyeColor'] as String,
  bloodGroup: json['bloodGroup'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'maidenName': instance.maidenName,
  'age': instance.age,
  'gender': instance.gender,
  'email': instance.email,
  'phone': instance.phone,
  'username': instance.username,
  'birthDate': instance.birthDate,
  'image': instance.image,
  'university': instance.uni,
  'height': instance.height,
  'weight': instance.weight,
  'eyeColor': instance.eyeColor,
  'bloodGroup': instance.bloodGroup,
  'role': instance.role,
};
