import 'package:bloc_apis/data/models/todo_model.dart';

abstract class TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TodoModel> todos;
  TodoLoadedState(this.todos);
}

class TodoErrorState extends TodoState {
  final String errMsg;
  TodoErrorState(this.errMsg);
}
