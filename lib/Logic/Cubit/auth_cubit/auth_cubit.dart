// import 'dart:convert';

import 'dart:convert';
import 'dart:developer';

import 'package:connect_up/Constants/enums.dart';
import 'package:connect_up/Data/repositories/auth_repository.dart';
import 'package:connect_up/Data/services/api_result.dart';
import 'package:connect_up/Data/services/network_exceptions.dart';
import 'package:connect_up/Data/services/secure_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final SecureStorage secureStorage;
  final AuthRepository authRepository;

  AuthCubit({
    required this.secureStorage,
    required this.authRepository,
  }) : super(const AuthState(status: AuthStatus.initial));

  void registerUser(String name, String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loggingIn));
    ApiResult<dynamic> sinupResponse =
        await authRepository.registerUser(name, email, password);
    sinupResponse.when(success: (dynamic response) {
      emit(state.copyWith(
        status: AuthStatus.loggedIn,
      ));
      log("********************[RECEIVED TOKEN]->   ${response["data"]["token"].toString()}  ");

      secureStorage.writeToLocalStorage(
          "TOKEN", response["data"]["token"].toString());
    }, failure: (NetworkExceptions error) {
      emit(state.copyWith(
        status: AuthStatus.unauthorized,
        message: NetworkExceptions.getErrorMessage(error),
      ));
    });
  }

  void loginUser(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loggingIn));
    ApiResult<dynamic> sinupResponse =
        await authRepository.loginUser(email, password);
    sinupResponse.when(success: (dynamic response) {
      emit(state.copyWith(
        status: AuthStatus.loggedIn,
      ));
      log("********************[RECEIVED TOKEN]->   ${response["data"]["token"].toString()}  ");
      // const secureStorage = FlutterSecureStorage();
      // secureStorage.write(
      //     key: "TOKEN", value: response["data"]["token"].toString());
      secureStorage.writeToLocalStorage(
          "TOKEN", response["data"]["token"].toString());
    }, failure: (NetworkExceptions error) {
      emit(state.copyWith(
        status: AuthStatus.unauthorized,
        message: NetworkExceptions.getErrorMessage(error),
      ));
    });
  }

  void registerUserWithGoogle(String name, String email, String password,
      String profilePhotoPath, String googleId) async {
    emit(state.copyWith(status: AuthStatus.loggingIn));
    // ApiResult<dynamic> sinupResponse =
    //     await authRepository.LoginUser(userName, password);
    // sinupResponse.when(success: (dynamic response) {
    //   emit(state.copyWith(
    //     status: AuthStatus.success,
    //   ));
    //   log("********************[RECEIVED TOKEN]->   ${response["data"]["token"].toString()}  ");
    //   // const secureStorage = FlutterSecureStorage();
    //   // secureStorage.write(
    //   //     key: "TOKEN", value: response["data"]["token"].toString());
    //   secureStorage.writeToLocalStorage(
    //       "TOKEN", response["data"]["token"].toString());
    // }, failure: (NetworkExceptions error) {
    //   emit(state.copyWith(
    //     status: AuthStatus.failure,
    //     message: NetworkExceptions.getErrorMessage(error),
    //   ));
    // });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toMap();
  }
}
