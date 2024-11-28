import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoAdd([])) {

    // handle to add event
    on<TodoAddEvent>((event, emit) {
      if (event.todo.trim().isEmpty) {
        emit(const TodoError("Todo cannot be empty!"));
        return;
      }
      // get the updated list by adding the new todo into the state
      final updatedList = List<String>.from(state.todoList)..add(event.todo);
      // emit and upate the state
      emit(TodoAdd(updatedList));
    });

    // handle the delete event
    on<TodoDeleteEvent>((event, emit) {
      // get the updated list by adding the new todo into the state
      final updatedList = List<String>.from(state.todoList)..remove(event.todo);
      // emit and upate the state
      emit(TodoAdd(updatedList));
    });
  }
}
