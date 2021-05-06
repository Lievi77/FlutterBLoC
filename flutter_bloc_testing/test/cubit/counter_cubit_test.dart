//! MAKE SURE TO IMPORT THE TEST PACKAGE AND THE CUBIT/BLOC YOU WANT TO TEST
import 'package:bloc_test/bloc_test.dart';
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
      // ? Unit Testing returns a failed test but why?
      //! Dart compares intances by memory reference.
      //! Since two diff instances are stored in diff parts of the memory, they are
      //! not equal in dart's view.
      //* To override this behaviour, use the EQUATABLE package
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    //* Time to test the cubit's functions
    //! Remember to describe explicitly what the test checks for
    blocTest(
        'The Cubit should emit a CounterState(counterValue:1, wasIncremented: true) when cubit.increment is called',
        //! Build method returns the instance of the cubit, to make it available for testing
        build: () => counterCubit,
        //! Act takes the cubit an applies the function/action to test
        act: (cubit) => cubit.increment(),
        //! Expect returns interable list. It contains the expected emitted states
        expect: () => [CounterState(counterValue: 1, wasIncremented: true)]);

    blocTest(
        'The Cubit should emit a CounterState(counterValue:-1, wasIncremented: false) when cubit.increment is called',
        //! Build method returns the instance of the cubit, to make it available for testing
        build: () => counterCubit,
        //! Act takes the cubit an applies the function/action to test
        act: (cubit) => cubit.decrement(),
        //! Expect returns interable list. It contains the expected emitted states
        expect: () => [CounterState(counterValue: -1, wasIncremented: false)]);
  });
}
