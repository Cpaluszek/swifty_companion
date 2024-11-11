import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty_companion/core/network/dio_configuration.dart';
import 'package:swifty_companion/modules/home_screen/bloc/user_bloc.dart';
import 'package:swifty_companion/modules/login/bloc/auth_bloc.dart';
import 'package:swifty_companion/modules/login/bloc/auth_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key,
      required this.token,
      required this.expirationDate,
      required this.refreshToken});

  final String token;
  final String refreshToken;
  final DateTime expirationDate;

  static Route<void> route(
      String token, String refreshToken, DateTime expirationDate) {
    return MaterialPageRoute<void>(
      builder: (_) => HomeScreen(
        token: token,
        refreshToken: refreshToken,
        expirationDate: expirationDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dioService = RepositoryProvider.of<DioConfiguration>(context);
    return BlocProvider(
      create: (context) =>
          UserBloc(dio: dioService.dio)..add(FetchProfileRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Access Token: $token'),
              const SizedBox(height: 8),
              Text('Refresh Token: $refreshToken'),
              const SizedBox(height: 8),
              Text('Expiration Date: ${expirationDate.toLocal()}'),
              const SizedBox(height: 20),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoaded) {
                    return Column(
                      children: [
                        const Divider(
                          thickness: 2,
                        ),
                        Text('User Loaded: ${state.user.displayName}'),
                      ],
                    );
                  } else if (state is UserError) {
                    return Text('Error: ${state.error}');
                  } else {
                    return const Center(child: Text('No Data'));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
