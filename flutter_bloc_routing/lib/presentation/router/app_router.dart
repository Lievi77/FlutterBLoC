import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter/presentation/screens/home_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_counter/presentation/screens/third_screen.dart';

//Example of a generated routing class

class AppRouter {
//cubit declaration
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    //access with settings.name
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(
                  title: "Home Screen",
                )));
        break;
      case "/second":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(
                  title: "Second Screen",
                )));
        break;
      case "/third":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: ThirdScreen(
                  title: "Third Screen",
                )));
        break;
      default:
        return null;
    }
  }

//When using BlocProvider.value,
// the cubit does auto close
  void dispose() {
    _counterCubit.close();
  }
}
