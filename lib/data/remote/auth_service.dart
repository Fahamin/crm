import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../core/constant.dart';

class AuthService {
  Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("${ApiConfig.BASEURL}${ApiConfig.getNpl}CRM_USERS_LOGIN.PHP"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "email": email,
          "password": password,
        },
      );

      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<http.Response> register({
    required String name,
    required String email,
    required String password,
    required int userType,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("${ApiConfig.BASEURL}${ApiConfig.getNpl}CMR_USERS_REG.PHP"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "name": name,
          "email": email,
          "password": password,
          "user_type": userType.toString(), // ✅ must be String
        },
      );

      return response;
    } catch (e) {
      debugPrint("Register API error: $e");
      return Future.error(e);
    }
  }


}
