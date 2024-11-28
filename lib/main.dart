import 'package:bloc_tutorial/counter/bloc/counter_bloc.dart';
import 'package:bloc_tutorial/counter/counterblocpage.dart';
import 'package:bloc_tutorial/todo/bloc/todo_bloc.dart';
import 'package:bloc_tutorial/todo/todo_page.dart';
import 'package:bloc_tutorial/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/cubit/counter.cubit.dart';
import 'counter/countercubitpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // multiblocprovider allows multiple blocs in a list
    // allowing doing the same without nesting blocproviders
    // this method keeps the codebase clean
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(),
        ),
        BlocProvider<CounterBloc>(create: (_) => CounterBloc()),
        BlocProvider<TodoBloc>(create: (_) => TodoBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const CustomWrapper(),
          '/counter_cubit': (context) =>
              const CounterCubitPage(title: 'Counter with cubit'),
          '/counter_bloc': (context) =>
              const CounterBlocPage(title: 'Counter with bloc'),
          '/todo': (context) => TodoPage(title: "Todo with bloc"),
        },
      ),
    );
  }
}
