// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, must_be_immutable

//https://picsum.photos/200/300   //  ⌘ ñ
import 'package:auto_route/auto_route.dart';
import 'package:connect_up/Data/services/secure_storage.dart';
import 'package:connect_up/Logic/block_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'Routes/routes.gr.dart';
// flutter packages pub run build_runner watch


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // final storage = await HydratedStorage.build();
  // hydrated storage is persisted across app restarts
  final HydratedStorage hydratedStorage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  final secureStorage = SecureStorage();
  bool isLoggedIn = await secureStorage.hasToken();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  var blocProviders = await getBlocProviders(secureStorage, hydratedStorage);

  HydratedBlocOverrides.runZoned(
      () => runApp(
            MyApp(
              blocProviders: blocProviders,
              isLoggedIn: isLoggedIn,
            ),
          ),
      storage: hydratedStorage);
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final List<BlocProvider> blocProviders;
  bool isLoggedIn;

  MyApp({
    Key? key,
    required this.blocProviders,
    required this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp.router(
        // theme: appThemeData[AppTheme.lightTheme],
        // theme: ThemeData(primaryColor: const Color(0xff23A6B1)),

        title: 'ConnectUp',
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(initialRoutes: [
          isLoggedIn ? LoginAndRegisterScreen() : LoginAndRegisterScreen()
        ]),

        // routerDelegate: _appRouter.delegate(),

        routeInformationParser:
            _appRouter.defaultRouteParser(includePrefixMatches: true),
        // _appRouter.
        //routes: {  targetscreen.routeName:(ctx)=>const targetscreen(),},
      ),
    );
  }
}
