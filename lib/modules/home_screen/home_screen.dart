import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty_companion/core/network/dio_configuration.dart';
import 'package:swifty_companion/modules/home_screen/bloc/user_bloc.dart';
import 'package:swifty_companion/modules/home_screen/widget/search_bar.dart';
import 'package:swifty_companion/modules/home_screen/widget/user_info_widget.dart';
import 'package:swifty_companion/modules/login/bloc/auth_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // TODO: Implement search
    print('Search: $query');
  }

  void _clearSearch() {
    _searchController.clear();
    _onSearchChanged('');
  }

  void _unfocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final dioService = RepositoryProvider.of<DioConfiguration>(context);

    return BlocProvider(
      create: (context) => UserBloc(dio: dioService.dio)..add(FetchProfileRequested()),
      child: GestureDetector(
        onTap: _unfocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: SearchWidget(
              controller: _searchController,
              focusNode: _focusNode,
              onChanged: _onSearchChanged,
              onClear: _clearSearch,
            ),
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
      ),
    );
  }
}
