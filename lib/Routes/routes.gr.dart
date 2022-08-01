// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../Presentation/Screens/Auth/sign_in.dart' as _i3;
import '../Presentation/Screens/UserProfile/user_profile_screen.dart' as _i2;
import '../Presentation/Widgets/comind_soon_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ComingSoonScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ComingSoonScreen());
    },
    UserProfileScreen.name: (routeData) {
      final args = routeData.argsAs<UserProfileScreenArgs>(
          orElse: () => const UserProfileScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.UserProfileScreen(key: args.key));
    },
    LoginScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(ComingSoonScreen.name, path: '/coming-soon-screen'),
        _i4.RouteConfig(UserProfileScreen.name, path: '/user-profile-screen'),
        _i4.RouteConfig(LoginScreen.name, path: '/login-screen')
      ];
}

/// generated route for
/// [_i1.ComingSoonScreen]
class ComingSoonScreen extends _i4.PageRouteInfo<void> {
  const ComingSoonScreen()
      : super(ComingSoonScreen.name, path: '/coming-soon-screen');

  static const String name = 'ComingSoonScreen';
}

/// generated route for
/// [_i2.UserProfileScreen]
class UserProfileScreen extends _i4.PageRouteInfo<UserProfileScreenArgs> {
  UserProfileScreen({_i5.Key? key})
      : super(UserProfileScreen.name,
            path: '/user-profile-screen',
            args: UserProfileScreenArgs(key: key));

  static const String name = 'UserProfileScreen';
}

class UserProfileScreenArgs {
  const UserProfileScreenArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'UserProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i4.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}
