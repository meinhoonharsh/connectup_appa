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

import '../Presentation/Screens/Auth/sign_in.dart' as _i2;
import '../Presentation/Screens/Auth/sign_up.dart' as _i6;
import '../Presentation/Screens/Home/home_screen.dart' as _i4;
import '../Presentation/Screens/IntroScreen/intrest_page.dart' as _i3;
import '../Presentation/Screens/IntroScreen/onboarding_screen.dart' as _i1;
import '../Presentation/Screens/UserProfile/user_profile_screen.dart' as _i7;
import '../Presentation/Widgets/comind_soon_page.dart' as _i5;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    OnBoardingScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoardingScreen());
    },
    SignInScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInScreen());
    },
    IntrestScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.IntrestScreen());
    },
    HomeScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    ComingSoonScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ComingSoonScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SignUpScreen());
    },
    UserProfileScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.UserProfileScreen());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(OnBoardingScreen.name, path: '/'),
        _i8.RouteConfig(SignInScreen.name, path: '/sign-in-screen'),
        _i8.RouteConfig(IntrestScreen.name, path: '/intrest-screen'),
        _i8.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i8.RouteConfig(ComingSoonScreen.name, path: '/coming-soon-screen'),
        _i8.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i8.RouteConfig(UserProfileScreen.name, path: '/user-profile-screen')
      ];
}

/// generated route for
/// [_i1.OnBoardingScreen]
class OnBoardingScreen extends _i8.PageRouteInfo<void> {
  const OnBoardingScreen() : super(OnBoardingScreen.name, path: '/');

  static const String name = 'OnBoardingScreen';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInScreen extends _i8.PageRouteInfo<void> {
  const SignInScreen() : super(SignInScreen.name, path: '/sign-in-screen');

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i3.IntrestScreen]
class IntrestScreen extends _i8.PageRouteInfo<void> {
  const IntrestScreen() : super(IntrestScreen.name, path: '/intrest-screen');

  static const String name = 'IntrestScreen';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i8.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i5.ComingSoonScreen]
class ComingSoonScreen extends _i8.PageRouteInfo<void> {
  const ComingSoonScreen()
      : super(ComingSoonScreen.name, path: '/coming-soon-screen');

  static const String name = 'ComingSoonScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i8.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.UserProfileScreen]
class UserProfileScreen extends _i8.PageRouteInfo<void> {
  const UserProfileScreen()
      : super(UserProfileScreen.name, path: '/user-profile-screen');

  static const String name = 'UserProfileScreen';
}
