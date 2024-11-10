import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:swifty_companion/config/env_config.dart';
import 'package:swifty_companion/config/theme.dart';
import 'package:swifty_companion/dio_service.dart';
import 'package:swifty_companion/login/bloc/auth_bloc.dart';
import 'package:swifty_companion/login/bloc/auth_event.dart';
import 'package:swifty_companion/login/bloc/auth_state.dart';
import 'package:swifty_companion/login/view/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty_companion/home_screen/home_screen.dart';
import 'package:swifty_companion/splash_page.dart';
import 'package:provider/provider.dart';

Future main() async {
  await EnvConfig.loadEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(InitRequested()),
          lazy: false,
        ),
        RepositoryProvider(create: (context) => DioService(context.read<AuthBloc>())),
        // Add more providers here as needed (e.g., other services, blocs, etc.)
      ],
      child: RepositoryProvider(
        create: (context) => DioService(context.read<AuthBloc>()),
        child: const AuthWrapper(),
      ),
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
              _navigator.pushAndRemoveUntil<void>(
                HomeScreen.route(
                  state.accessToken,
                  state.refreshToken,
                  state.expiration,
                ),
                (route) => false,
              );
            } else if (state is AuthLoading) {
              _navigator.pushAndRemoveUntil<void>(
                SplashPage.route(),
                (route) => false,
              );
            } else {
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
