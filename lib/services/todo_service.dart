import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoItem {
  TodoItem(
      {required this.userId,
      required this.taskId,
      required this.title,
      required this.completed});
  final int userId;
  final int taskId;
  final String title;
  bool completed;
}

class TodoAPI {
  Future<List<TodoItem>> getTodoItems() async {
    print('getTodoItems called');
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    final todos = (jsonDecode(response.body) as List)
        .map((e) => e as TodoItem)
        .toList(growable: false);
    //print(todos);
    return todos;
  }
}
