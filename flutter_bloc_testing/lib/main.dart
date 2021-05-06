import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_testing/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //! This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        // Notice that a Cubit/Bloc is not available for the root Widget.
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // ! Need to specify cubit and  state
      // !!!! But is there a way to simplify BlocListener and BlocBuilder?
      // !!!! The code clutter is a lot!!! A: Yes, we can use BlocConsumer
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // ! But how do we update the UI to reflect the Cubit's state change?
            //! A: BlocBuilder!
            BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Increased!"),
                      duration: Duration(milliseconds: 40),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Decreased!"),
                      duration: Duration(milliseconds: 40),
                    ));
                  }
                },
                builder: (context, state) => Text(state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    //! No need to instantiate a new Cubit, CubitProvider at the
                    // ! Parent widget provides an instance
                    // !! ALWAYS SPECIFY THE TYPE OF CUBIT
                    BlocProvider.of<CounterCubit>(context).decrement();

                    // ? Alternate Syntax: context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
