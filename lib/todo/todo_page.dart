import 'package:bloc_tutorial/todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key, required this.title});
  final String title;

  // todo controller to retreive text from the textfield

  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // get the todoBloc from provider

    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      //appbar
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),

      //body
      body: SafeArea(
          child: Column(
        children: [
          // textfield
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Write todo here'),
            ),
          ),

          // space between textfield and todos
          const SizedBox(
            height: 20,
          ),

          Container(
            height: 50,
            width: double.infinity,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Todos',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // todo list
          Expanded(child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              List<String> todos = state.todoList;
              return todos.isEmpty
                  ? const Center(
                      child: Text(
                        'No todos found!',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: ListTile(
                            tileColor: Colors.grey.shade300,
                            leading: const Icon(Icons.work),
                            title: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              todos[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  todoBloc.add(TodoDeleteEvent(todos[index]));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        );
                      });
            },
          ))
        ],
      )),

      // todo add button:
      // bloc listener listens to the current state
      // if the state is in error state it shows the snackbar
      // with the error message

      floatingActionButton: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.message!,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: FloatingActionButton(
          onPressed: () {
            // get the todo text using the controller from the textfield
            final String todo = _todoController.text.trim();
            // add the todo
            todoBloc.add(TodoAddEvent(todo));
            // clear the textfield
            _todoController.clear();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
