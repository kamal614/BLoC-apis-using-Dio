import 'dart:developer';

import 'package:bloc_apis/data/apis/api.dart';
import 'package:bloc_apis/data/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRespositories {
  //Creating instance of the API
  API api = API();
  Future<List<TodoModel>> fetchTodos() async {
    try {
      Response response = await api.sendRequest.get("/todos");
      List<dynamic> todoMap = response.data;
      return todoMap
          .map((todoDataMap) => TodoModel.fromJson(todoDataMap))
          .toList();
    } catch (e) {
      throw (e.toString());
    }
  }
}
