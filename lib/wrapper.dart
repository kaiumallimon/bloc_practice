import 'package:flutter/material.dart';

class CustomWrapper extends StatelessWidget {
  const CustomWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Bloc Tutorial'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/counter_cubit'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Counter with Cubit')),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/counter_bloc'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Counter with Bloc')),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/todo'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Todo with Bloc')),
          ),
        ],
      )),
    );
  }
}
