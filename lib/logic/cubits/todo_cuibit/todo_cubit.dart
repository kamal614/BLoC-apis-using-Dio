import 'package:bloc/bloc.dart';
import 'package:bloc_apis/data/repositories/todo_repositories.dart';
import 'package:bloc_apis/logic/cubits/todo_cuibit/todo_state.dart';

import '../../../data/models/todo_model.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoLoadingState()) {
    fetchTodos();
  }
  TodoRespositories todoRespositories = TodoRespositories();
  void fetchTodos() async {
    try {
      List<TodoModel> todoData = await todoRespositories.fetchTodos();
      emit(TodoLoadedState(todoData));
    } catch (e) {
      emit(TodoErrorState(e.toString()));
    }
  }
}
