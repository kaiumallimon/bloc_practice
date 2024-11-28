import 'package:bloc_tutorial/counter/bloc/counter_bloc.dart';
import 'package:bloc_tutorial/counter/cubit/counter.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // create a instance of cubit
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'You have pushed the button this many times:',
            ),
          ),

          const SizedBox(height: 10),

          // Add a Text widget with bloc builder to listen the
          // changes 
          BlocBuilder<CounterBloc, int>(builder: (context, state) {
            // state is the integer variable here
            return Text(state.toString(),
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold));
          }),
        ],
      ),

      // Add a floating action button

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add onPressed logic
          /*
          add the event to the counter bloc to happen when the button is pressed.
          */
          counterBloc.add(CounterIncrement());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
