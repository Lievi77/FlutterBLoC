part of 'counter_cubit.dart';

//! Need to specify how we should compare
class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;
  CounterState({@required this.counterValue, this.wasIncremented});

  //! overrdie equatable.props method for comparison details
  //! Return the properties we will use for comparisons
  List<Object> get props => [this.counterValue, this.wasIncremented];
}
