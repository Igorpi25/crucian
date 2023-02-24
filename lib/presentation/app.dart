import 'package:crucian/presentation/boundary/incoming.dart';
import 'package:crucian/presentation/boundary/outgoing.dart';
import 'package:crucian/presentation/view/home/home_page.dart';
import 'package:crucian/presentation/view/loader/loader_page.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class App extends StatelessWidget {
  App({super.key, required IncrementBoundary incrementBoundary, required LoadInitialBoundary loadInitialBoundary}):
  _incrementBoundary = incrementBoundary,
  _loadInitialBoundary = loadInitialBoundary;

  UpdateListener get updateListener => _counterCubit;

  final IncrementBoundary _incrementBoundary;
  final LoadInitialBoundary _loadInitialBoundary;

  CounterCubit? _counterCubitInstance;
  CounterCubit get _counterCubit => _counterCubitInstance ??= CounterCubit(loadInitialBoundary: _loadInitialBoundary); 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<CounterCubit, CounterState>(
        bloc: _counterCubit..load(),
        builder: (context, state) {
          if (state is CounterStateData) {
            debugPrint('CounterStateData in app');
            return HomePage(incrementBoundary: _incrementBoundary, currentValue: state.value);
          }
          if (state is CounterStateLoading) {
            debugPrint('CounterStateLoading in app');
            return const LoaderPage();
          }

          throw Exception('Unknown state in PageCubit: $state');
        },
      ),
    );
  }
}

class CounterCubit extends  Cubit<CounterState> implements UpdateListener {
  
  CounterCubit({required LoadInitialBoundary loadInitialBoundary}):_loadInitialBoundary = loadInitialBoundary, super(CounterStateLoading());

  late final LoadInitialBoundary _loadInitialBoundary;

  void load() {
    debugPrint('load in CounterCubit');
    _loadInitialBoundary.loadInitial();
  }
  
  @override
  void onUpdate(int newValue) {
    debugPrint('onUpdate in CounterCubit');
    emit(CounterStateData(newValue));
  }

}

abstract class CounterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterStateData extends CounterState {
  CounterStateData(this.value);

  final int value;

  @override
  List<Object?> get props => [value];
}

class CounterStateLoading extends CounterState {

}