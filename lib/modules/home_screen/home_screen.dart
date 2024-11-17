import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty_companion/core/network/dio_configuration.dart';
import 'package:swifty_companion/modules/home_screen/bloc/user_bloc.dart';
import 'package:swifty_companion/modules/home_screen/widget/user_info_widget.dart';
import 'package:swifty_companion/modules/login/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final dioService = RepositoryProvider.of<DioConfiguration>(context);

    return BlocProvider(
      create: (context) => UserBloc(dio: dioService.dio)..add(FetchProfileRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: UserInfoWidget(),
        ),
      ),
    );
  }
}
