// import 'package:flutter/cupertino.dart';

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:connect_up/Data/services/api_result.dart';
import 'package:connect_up/Data/services/dio_client.dart';
import 'package:connect_up/Data/services/network_exceptions.dart';

class AuthRepository {
  late DioClient dioClient;

  AuthRepository() {
    dioClient = DioClient();
  }

  Future<ApiResult<dynamic>> registerUser(
      String name, String email, String password) async {
    Map details = {
      "name": name,
      "email": email,
      "password": password,
      "c_password": password
    };
    try {
      final response =
          await dioClient.post("/api/register", data: json.encode(details));

      log("----------------> AuthRepository -> SinupUser  -> response ->  ${response.toString()} ----------------");
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> AuthRepository -> SinupUser  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> loginUser(String email, String password) async {
    Map details = {"email": email, "password": password};

    try {
      final response =
          await dioClient.post("/api/login", data: json.encode(details));

      log("----------------> AuthRepository -> LoginUser  -> response ->  ${response.toString()} ----------------");
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> AuthRepository -> LoginUser  -> error ->  ${e.toString()} ----------------");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> googleLogin(String name, String email,
      String password, String profile_photo_path, String googleId) async {
    Map details = {
      "name": name,
      "email": email,
      "password": password,
      "profile_photo_path": profile_photo_path,
      "google_id": googleId
    };

    try {
      final response =
          await dioClient.post("/api/googleauth", data: json.encode(details));

      log("----------------> AuthRepository -> GoogleLogin  -> response ->  ${response.toString()} ----------------");
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> AuthRepository -> GoogleLogin  -> error ->  ${e.toString()} ----------------");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  // Future<ApiResult<dynamic>> verifyOtp(
  //     String userId, String phoneNumber, int verificationCode) async {
  //   try {
  //     final response = await dioClient.post("/identity/OTP/verify", data: {
  //       "userId": userId,
  //       "phoneNumber": phoneNumber,
  //       "verificationCode": verificationCode
  //     });
  //     return const ApiResult.success(data: "otpVerificationResponse");
  //   } catch (e) {
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }
}
