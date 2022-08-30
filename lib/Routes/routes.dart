import 'package:auto_route/auto_route.dart';
import 'package:connect_up/Presentation/Screens/Auth/login_and_register_screen.dart';
import 'package:connect_up/Presentation/Screens/ConnectUpInfo/about_connectup.dart';
import 'package:connect_up/Presentation/Screens/Home/home_screen.dart';
import 'package:connect_up/Presentation/Screens/UserProfile/UserStartupScreens/user_start_up_screen.dart';
import 'package:connect_up/Presentation/Screens/UserProfile/user_profile_screen.dart';
import 'package:connect_up/Presentation/Screens/UserProfile/user_profile_info.dart';
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
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ExploreConnectUpScreen),
    AutoRoute(page: UserProfileInfoScreen),
    AutoRoute(page: UserProfileScreen),
    AutoRoute(page: UserStartUpInfoScreen),
    AutoRoute(page: LoginAndRegisterScreen),

    // AutoRoute(page: SignUpScreen),
    // AutoRoute(page: UserProfileScreen),
  ],
)
class $AppRouter {}
