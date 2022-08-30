// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../Presentation/Screens/Auth/login_and_register_screen.dart' as _i7;
import '../Presentation/Screens/ConnectUpInfo/about_connectup.dart' as _i3;
import '../Presentation/Screens/Home/home_screen.dart' as _i2;
import '../Presentation/Screens/UserProfile/user_profile_info.dart' as _i4;
import '../Presentation/Screens/UserProfile/user_profile_screen.dart' as _i5;
import '../Presentation/Screens/UserProfile/UserStartupScreens/user_start_up_screen.dart'
    as _i6;
import '../Presentation/Widgets/comind_soon_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    ComingSoonScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ComingSoonScreen());
    },
    HomeScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    ExploreConnectUpScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ExploreConnectUpScreen());
    },
    UserProfileInfoScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.UserProfileInfoScreen());
    },
    UserProfileScreen.name: (routeData) {
      final args = routeData.argsAs<UserProfileScreenArgs>(
          orElse: () => const UserProfileScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.UserProfileScreen(key: args.key));
    },
    UserStartUpInfoScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.UserStartUpInfoScreen());
    },
    LoginAndRegisterScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.LoginAndRegisterScreen());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(ComingSoonScreen.name, path: '/coming-soon-screen'),
        _i8.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i8.RouteConfig(ExploreConnectUpScreen.name,
            path: '/explore-connect-up-screen'),
        _i8.RouteConfig(UserProfileInfoScreen.name,
            path: '/user-profile-info-screen'),
        _i8.RouteConfig(UserProfileScreen.name, path: '/user-profile-screen'),
        _i8.RouteConfig(UserStartUpInfoScreen.name,
            path: '/user-start-up-info-screen'),
        _i8.RouteConfig(LoginAndRegisterScreen.name,
            path: '/login-and-register-screen')
      ];
}

/// generated route for
/// [_i1.ComingSoonScreen]
class ComingSoonScreen extends _i8.PageRouteInfo<void> {
  const ComingSoonScreen()
      : super(ComingSoonScreen.name, path: '/coming-soon-screen');

  static const String name = 'ComingSoonScreen';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i8.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.ExploreConnectUpScreen]
class ExploreConnectUpScreen extends _i8.PageRouteInfo<void> {
  const ExploreConnectUpScreen()
      : super(ExploreConnectUpScreen.name, path: '/explore-connect-up-screen');

  static const String name = 'ExploreConnectUpScreen';
}

/// generated route for
/// [_i4.UserProfileInfoScreen]
class UserProfileInfoScreen extends _i8.PageRouteInfo<void> {
  const UserProfileInfoScreen()
      : super(UserProfileInfoScreen.name, path: '/user-profile-info-screen');

  static const String name = 'UserProfileInfoScreen';
}

/// generated route for
/// [_i5.UserProfileScreen]
class UserProfileScreen extends _i8.PageRouteInfo<UserProfileScreenArgs> {
  UserProfileScreen({_i9.Key? key})
      : super(UserProfileScreen.name,
            path: '/user-profile-screen',
            args: UserProfileScreenArgs(key: key));

  static const String name = 'UserProfileScreen';
}

class UserProfileScreenArgs {
  const UserProfileScreenArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'UserProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.UserStartUpInfoScreen]
class UserStartUpInfoScreen extends _i8.PageRouteInfo<void> {
  const UserStartUpInfoScreen()
      : super(UserStartUpInfoScreen.name, path: '/user-start-up-info-screen');

  static const String name = 'UserStartUpInfoScreen';
}

/// generated route for
/// [_i7.LoginAndRegisterScreen]
class LoginAndRegisterScreen extends _i8.PageRouteInfo<void> {
  const LoginAndRegisterScreen()
      : super(LoginAndRegisterScreen.name, path: '/login-and-register-screen');

  static const String name = 'LoginAndRegisterScreen';
}
