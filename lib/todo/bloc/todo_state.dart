part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState({this.todoList = const [], this.message});

  final List<String> todoList;
  final String? message;

  @override
  List<Object> get props => [todoList];
}

final class TodoAdd extends TodoState {
  const TodoAdd(List<String> todoList) : super(todoList: todoList);
}

final class TodoDelete extends TodoState {
  const TodoDelete(List<String> todoList) : super(todoList: todoList);
}

final class TodoError extends TodoState {
  const TodoError(String message) : super(message: message);
}
