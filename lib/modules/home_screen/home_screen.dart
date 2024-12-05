import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty_companion/modules/home_screen/bloc/user_bloc.dart';
import 'package:swifty_companion/modules/home_screen/widget/search_widget.dart';
import 'package:swifty_companion/modules/home_screen/widget/user_info_widget.dart';
import 'package:swifty_companion/modules/login/bloc/auth_bloc.dart';
import 'package:swifty_companion/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BaseUserBloc getUserBloc(BuildContext context) {
    var searchedUserBloc = context.read<SearchedUserBloc>();
    return searchedUserBloc.state is UserLoaded ? context.read<SearchedUserBloc>() : context.read<UserBloc>();
  }

  IconButton getAppBarAction(BuildContext context) {
    if (context.read<SearchedUserBloc>().state is UserLoaded) {
      return IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => context.read<SearchedUserBloc>().add(ClearSearchedUser()),
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final focusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        if (!focusNode.hasFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: SearchWidget(
            controller: searchController,
            focusNode: focusNode,
            isLoading: context.read<SearchedUserBloc>().state is UserLoading,
            onSearch: (query) {
              if (query.isNotEmpty) {
                context.read<SearchedUserBloc>().add(FetchProfileByUsername(query));
              }
            },
            onClear: () => searchController.clear(),
          ),
          actions: [getAppBarAction(context)],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                setState(() {});
              },
            ),
            BlocListener<SearchedUserBloc, UserState>(
              listener: (context, state) {
                setState(() {});
                if (state is UserError) {
                  showErrorSnackBar(context, state.error);
                }
              },
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: UserInfoWidget(
              userBloc: getUserBloc(context),
            ),
          ),
        ),
      ),
    );
  }
}
