import 'dart:developer';

import 'package:bloc_apis/data/models/todo_model.dart';
import 'package:bloc_apis/data/repositories/todo_repositories.dart';
import 'package:bloc_apis/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TodoRespositories todoRespositories = TodoRespositories();
  List<TodoModel> myTodoList = await todoRespositories.fetchTodos();
  log(myTodoList.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Api Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
