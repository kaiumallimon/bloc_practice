part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoAddEvent extends TodoEvent {
  final String todo;
  const TodoAddEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class TodoDeleteEvent extends TodoEvent {
  final String todo;
  const TodoDeleteEvent(this.todo);

  @override
  List<Object> get props => [todo];
}