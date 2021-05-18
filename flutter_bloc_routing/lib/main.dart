import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; //package import

import 'business_logic/cubit/counter_cubit.dart'; // relative import
import 'presentation/screens/home_screen.dart';
import 'presentation/router/app_router.dart'; //generated routing

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Notice that a Cubit/Bloc is not available for the root Widget.
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      //usage of generated routing
      //note how we are passing the function
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
