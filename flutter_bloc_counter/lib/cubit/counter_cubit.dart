import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  //! To emit a state stream in a cubit, use emit()
  void increment() => emit(CounterState(counterValue: state.counterValue + 1));

  // To access a the current state's properties use state.PROPERTY_TO_ACCESS
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}
