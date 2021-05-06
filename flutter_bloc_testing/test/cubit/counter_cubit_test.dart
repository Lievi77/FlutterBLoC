//! MAKE SURE TO IMPORT THE TEST PACKAGE AND THE CUBIT/BLOC YOU WANT TO TEST
import 'package:flutter_bloc_testing/cubit/counter_cubit.dart';
import 'package:test/test.dart';

//! Naming convention for test files: [SAME_NAME_AS_LIB_FILE]_test.dart
// ! IMPORTANT: FOLLOW THE NAMING CONVENTION EXACTLY OR FLUTTER WON'T RECOGNIZE THE TEST

//! Example of test writing
main() {
  //grouping example
  group('CounterCubit', () {
    CounterCubit counterCubit;
    //the set up function runs before each test is run
    //registers the function before execution
    //think of it as preparing the test field
    setUp(() {
      //init
      counterCubit = CounterCubit();
    });

    //the teardown function runs after execution
    // think of it as closing the test group
    tearDown(() {
      counterCubit.close();
    });

    //declaring a test example
    test(
        'The initial state for the CounterCubit is CounterCubit(counterValue: 0)',
        () {
      //expect function

      expect(counterCubit.state, CounterState(counterValue: 0));
    });
  });
}
