import 'package:crucian/presentation/boundary/repository.dart';
import 'package:crucian/presentation/common_bloc/loader_cubit.dart';
import 'package:crucian/presentation/model/clicker.dart';
import 'package:crucian/presentation/view/home/home_page.dart';
import 'package:crucian/presentation/view/loader/loader_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef PageCubit = LoaderCubit<Clicker>;
typedef PageState = LoaderState<Clicker>;
typedef PageLoadingState = LoadingState<Clicker>;
typedef PageLoadedState = LoadedState<Clicker>;

class App extends StatelessWidget {
  const App({super.key, required this.repository});

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<PageCubit, PageState>(
        bloc: PageCubit(repository.load())..load(),
        builder: (context, state) {
          if (state is PageLoadedState) {
            return HomePage(clicker: state.data);
          }
          if (state is LoadingState) {
            return const LoaderPage();
          }
          throw Exception('Unknown state in PageCubit: $state');
        },
      ),
    );
  }

}
