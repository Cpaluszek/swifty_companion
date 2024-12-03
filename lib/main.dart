import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swifty_companion/config/app_config.dart';
import 'package:swifty_companion/config/theme.dart';
import 'package:swifty_companion/core/network/dio_configuration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty_companion/modules/home_screen/bloc/user_bloc.dart';
import 'package:swifty_companion/modules/home_screen/home_screen.dart';
import 'package:swifty_companion/modules/login/bloc/auth_bloc.dart';
import 'package:swifty_companion/modules/login/view/login.dart';
import 'package:swifty_companion/modules/splash_page.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await AppConfig.loadEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Flavor>.value(
          value: catppuccin.mocha,
        ),
        BlocProvider(
          create: (context) => AuthBloc()..add(InitRequested()),
          lazy: false,
        ),
        RepositoryProvider(create: (context) => DioConfiguration(authBloc: context.read<AuthBloc>())),
        BlocProvider(create: (context) => UserBloc(dio: context.read<DioConfiguration>().dio)),
        BlocProvider(create: (context) => SearchedUserBloc(dio: context.read<DioConfiguration>().dio)),
      ],
      child: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  /* TODO: test this
  You’re using a NavigatorKey and manually handling navigation in the AuthWrapper.
  While this works, another approach would be to use the auto_route package or other navigation libraries that simplify complex routing scenarios,
  especially if you need nested navigation or more complex routes
   */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swifty Companion',
      debugShowCheckedModeBanner: false,
      theme: catppuccinTheme(catppuccin.macchiato),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.read<UserBloc>().add(FetchProfileRequested());
              _navigator.pushAndRemoveUntil<void>(
                HomeScreen.route(),
                (route) => false,
              );
            } else if (state is AuthLoading) {
              _navigator.pushAndRemoveUntil<void>(
                SplashPage.route(),
                (route) => false,
              );
            } else {
              // TODO: test this
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
              _navigator.pushAndRemoveUntil<void>(
                LoginScreen.route(),
                (route) => false,
              );
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
