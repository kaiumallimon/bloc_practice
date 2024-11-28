import 'package:bloc_tutorial/counter/cubit/counter.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // create a instance of cubit

    /*
    * Using the blocprovider, we can use the same instance 
    * from multiple components (State will be reset only if the app restarted.)
    */
    final counterCubit = BlocProvider.of<CounterCubit>(context);

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

          // Add a Text widget

          BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, state) {
                return Text(state.toString(),
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold));
              }),
        ],
      ),

      // Add a floating action button

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add onPressed logic
          counterCubit.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
