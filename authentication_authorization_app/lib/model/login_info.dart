import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginInfo {
  @JsonKey(name: "accessToken")
  String accessToken;

  @JsonKey(name: "refreshToken")
  String refreshToken;

  @JsonKey(name: "username")
  String username;

  LoginInfo({
    required this.accessToken,
    required this.refreshToken,
    required this.username,
  });

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);
}
