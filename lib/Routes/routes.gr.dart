// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../Presentation/Screens/Auth/login_and_register_screen.dart' as _i4;
import '../Presentation/Screens/UserProfile/user_profile_info.dart' as _i2;
import '../Presentation/Screens/UserProfile/user_profile_screen.dart' as _i3;
import '../Presentation/Widgets/comind_soon_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ComingSoonScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ComingSoonScreen());
    },
    UserProfileInfoScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UserProfileInfoScreen());
    },
    UserProfileScreen.name: (routeData) {
      final args = routeData.argsAs<UserProfileScreenArgs>(
          orElse: () => const UserProfileScreenArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.UserProfileScreen(key: args.key));
    },
    LoginAndRegisterScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginAndRegisterScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(ComingSoonScreen.name, path: '/coming-soon-screen'),
        _i5.RouteConfig(UserProfileInfoScreen.name,
            path: '/user-profile-info-screen'),
        _i5.RouteConfig(UserProfileScreen.name, path: '/user-profile-screen'),
        _i5.RouteConfig(LoginAndRegisterScreen.name,
            path: '/login-and-register-screen')
      ];
}

/// generated route for
/// [_i1.ComingSoonScreen]
class ComingSoonScreen extends _i5.PageRouteInfo<void> {
  const ComingSoonScreen()
      : super(ComingSoonScreen.name, path: '/coming-soon-screen');

  static const String name = 'ComingSoonScreen';
}

/// generated route for
/// [_i2.UserProfileInfoScreen]
class UserProfileInfoScreen extends _i5.PageRouteInfo<void> {
  const UserProfileInfoScreen()
      : super(UserProfileInfoScreen.name, path: '/user-profile-info-screen');

  static const String name = 'UserProfileInfoScreen';
}

/// generated route for
/// [_i3.UserProfileScreen]
class UserProfileScreen extends _i5.PageRouteInfo<UserProfileScreenArgs> {
  UserProfileScreen({_i6.Key? key})
      : super(UserProfileScreen.name,
            path: '/user-profile-screen',
            args: UserProfileScreenArgs(key: key));

  static const String name = 'UserProfileScreen';
}

class UserProfileScreenArgs {
  const UserProfileScreenArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'UserProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.LoginAndRegisterScreen]
class LoginAndRegisterScreen extends _i5.PageRouteInfo<void> {
  const LoginAndRegisterScreen()
      : super(LoginAndRegisterScreen.name, path: '/login-and-register-screen');

  static const String name = 'LoginAndRegisterScreen';
}
