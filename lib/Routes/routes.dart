import 'package:auto_route/auto_route.dart';
import 'package:semikolan_app/Presentation/Screens/Auth/sign_in.dart';
import 'package:semikolan_app/Presentation/Screens/Auth/sign_up.dart';
import 'package:semikolan_app/Presentation/Screens/Home/home_screen.dart';
import 'package:semikolan_app/Presentation/Screens/IntroScreen/intrest_page.dart';
// ignore_for_file: prefer_const_constructors
import 'package:semikolan_app/Presentation/Screens/IntroScreen/onboarding_screen.dart';
import 'package:semikolan_app/Presentation/Screens/UserProfile/user_profile_screen.dart';
import 'package:semikolan_app/Presentation/Widgets/comind_soon_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // our new login routes are defined here!
    AutoRoute(page: OnBoardingScreen, initial: true),
    AutoRoute(page: SignInScreen),
    AutoRoute(page: IntrestScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ComingSoonScreen),
    AutoRoute(page: SignUpScreen),
    AutoRoute(page: UserProfileScreen),
  ],
)
class $AppRouter {}
