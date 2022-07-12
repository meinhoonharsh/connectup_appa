part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String userName;
  final String phoneNumber;
  final String userEmail;
  final String contactNumber;
  final AuthStatus status;

  final InitialScreenStatus initialScreenStatus;
  final String? message;

  const AuthState(
      {this.userName = "",
      this.phoneNumber = "",
      this.userEmail = "",
      this.contactNumber = "",
      this.status = AuthStatus.initial,
      this.initialScreenStatus = InitialScreenStatus.initial,
      this.message});

  @override
  List<Object> get props => [
        userName,
        phoneNumber,
        userName,
        userEmail,
        status,
        initialScreenStatus,
        contactNumber,
      ];

  // AuthState copyWith({
  //   String? userId,
  //   String? phoneNumber,
  //   String? contactNumber,
  //   AuthStatus? status,
  //   String? message,
  //   String? userName,
  //   String? userEmail,
  //   CountryCode? countryCode,
  //   InitialScreenStatus? initialScreenStatus,
  //   String? dialingCode,
  // }) {
  //   return AuthState(
  //     userId: userId ?? this.userId,
  //     phoneNumber: phoneNumber ?? this.phoneNumber,
  //     countryCode: countryCode ?? this.countryCode,
  //     contactNumber: contactNumber ?? this.contactNumber,
  //     userName: userName ?? this.userName,
  //     userEmail: userEmail ?? this.userEmail,
  //     status: status ?? this.status,
  //     initialScreenStatus: initialScreenStatus ?? this.initialScreenStatus,
  //     message: message ?? this.message,
  //     dialingCode: dialingCode ?? this.dialingCode,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'userId': userId,
  //     'userName': userName,
  //     'phoneNumber': phoneNumber,
  //     'userEmail': userEmail,
  //     'contactNumber': contactNumber,
  //     'status': status.index,
  //     'initialScreenStatus': initialScreenStatus.index,
  //     'message': message,
  //   };
  // }

  // factory AuthState.fromMap(Map<String, dynamic> map) {
  //   return AuthState(
  //     userId: map['userId'] ?? '',
  //     userName: map['userName'] ?? '',
  //     phoneNumber: map['phoneNumber'] ?? '',
  //     userEmail: map['userEmail'] ?? '',
  //     contactNumber: map['contactNumber'] ?? '',
  //     status: AuthStatus.values[map['status'] ?? 0],
  //     initialScreenStatus:
  //         InitialScreenStatus.values[map['initialScreenStatus'] ?? 0],
  //     message: map['message'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory AuthState.fromJson(String source) =>
  //     AuthState.fromMap(json.decode(source));

  AuthState copyWith({
    String? userName,
    String? phoneNumber,
    String? userEmail,
    String? contactNumber,
     AuthStatus? status,
    InitialScreenStatus? initialScreenStatus,
    String? message,
  }) {
    return AuthState(
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userEmail: userEmail ?? this.userEmail,
      contactNumber: contactNumber ?? this.contactNumber,
      status: status ?? this.status,
      initialScreenStatus: initialScreenStatus ?? this.initialScreenStatus,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
      'userEmail': userEmail,
      'contactNumber': contactNumber,
      // 'status': status.index,
      'initialScreenStatus': initialScreenStatus.index,
      'message': message,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      userName: map['userName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      userEmail: map['userEmail'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      // status: AuthStatus.values[map['status'] ?? 0],
      initialScreenStatus:
          InitialScreenStatus.values[map['initialScreenStatus'] ?? 0],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source));
}
