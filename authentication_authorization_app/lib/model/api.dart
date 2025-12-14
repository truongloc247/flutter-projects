import 'dart:convert';

import 'package:authentication_authorization_app/model/login_info.dart';
import 'package:authentication_authorization_app/model/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class API {
  late LoginInfo loginInfo;

  Future<LoginInfo?> login(
    String username,
    String password,
    int expiresInMins,
    BuildContext context,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NjUyNzExNDgsImV4cCI6MTc2NTI3Mjk0OH0.usc_LDhW-m0XWym63_k5ijXR0hrKR5RWnpmXi2PQDm0; refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NjUyNzExNDgsImV4cCI6MTc2Nzg2MzE0OH0.th0Ff7nXK5cYlbNhNVYbSMmU6jkezq9VeePeSKD1PME',
    };
    var data = json.encode({
      "username": username,
      "password": password,
      "expiresInMins": expiresInMins,
    });
    var dio = Dio();
    try {
      var response = await dio.request(
        'https://dummyjson.com/auth/login',
        options: Options(method: 'POST', headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        return LoginInfo.fromJson(response.data);
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<User?> getUserInfo(String token) async {
    var headers = {
      'Authorization': 'Bearer ${token}',
      'Cookie':
          'accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NjUyNzU3NTcsImV4cCI6MTc2NTI3NzU1N30.xsleKp-sF4psJz0FXSds_Z4nbghwzqVoIOyblRZTn68; refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NjUyNzU3NTcsImV4cCI6MTc2Nzg2Nzc1N30.8n7GqUr0UsGpZRtUSlEw35CNiENU8WRWPgP38_ed-L8',
    };
    var dio = Dio();
    try {
      var response = await dio.request(
        'https://dummyjson.com/auth/me',
        options: Options(method: 'GET', headers: headers),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
