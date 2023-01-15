import 'package:bloc_apis/logic/cubits/todo_cuibit/todo_cubit.dart';
import 'package:bloc_apis/logic/cubits/todo_cuibit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        if (state is TodoLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoErrorState) {
          return Center(child: Text(state.errMsg));
        } else if (state is TodoLoadedState) {
          return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index].title.toString()),
                );
              });
        }
        return Container();
      },
    ));
  }
}
