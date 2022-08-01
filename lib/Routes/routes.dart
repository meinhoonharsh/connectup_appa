import 'package:auto_route/auto_route.dart';
import 'package:connect_up/Presentation/Screens/Auth/sign_in.dart';
import 'package:connect_up/Presentation/Screens/UserProfile/user_profile_screen.dart';
import 'package:connect_up/Presentation/Widgets/comind_soon_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // our new login routes are defined here!
    // AutoRoute(page: OnBoardingScreen, initial: true),
    // AutoRoute(page: SignInScreen),
    // AutoRoute(page: IntrestScreen),
    // AutoRoute(page: HomeScreen),
    AutoRoute(page: ComingSoonScreen),
    AutoRoute(page: UserProfileScreen),
    AutoRoute(page: LoginScreen),

    // AutoRoute(page: SignUpScreen),
    // AutoRoute(page: UserProfileScreen),
  ],
)
class $AppRouter {}
