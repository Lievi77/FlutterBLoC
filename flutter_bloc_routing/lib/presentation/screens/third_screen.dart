import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; //package import

import '../../business_logic/cubit/counter_cubit.dart'; // relative import
import 'second_screen.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
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
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
                onPressed: () {
                  //! to pass a cubit to another screen, use RouteAccess
                  Navigator.of(context).push(MaterialPageRoute(
                      //! It is important to rename the new context variable so we avoid confusion
                      builder: (newContext) => BlocProvider.value(
                            //! MUST PASS AN EXISTING CUBIT/BLOC
                            value: BlocProvider.of<CounterCubit>(context),
                            child: SecondScreen(
                                title: "Another Screen", color: Colors.teal),
                          )));
                  // * The previous code snippet was an example of ANONYMOUS ROUTING
                  //* Since we only used the actual screen to navigate
                  //! On LARGE PROJECTS, use Generated Routing,
                  //! Small-Medium projects usually use named routing
                },
                child: Text("Go To Next Screen"),
                color: widget.color)
          ],
        ),
      ),
    );
  }
}
