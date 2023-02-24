part of 'value_cubit.dart';

class ValueState extends Equatable{
  const ValueState(this.data);

  final int data;

  @override
  List<Object?> get props => [data];
}
