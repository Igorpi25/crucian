import 'package:crucian/presentation/boundary/incoming.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'value_state.dart';

class ValueCubit<T> extends Cubit<ValueState> implements UpdateBoundary {
  ValueCubit(super.initialState);

  @override
  void updateValue(int newValue) {
    emit(ValueState(newValue));
  }
}
