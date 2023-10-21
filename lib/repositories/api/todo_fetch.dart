import 'dart:convert';

import 'package:app_auth/classes/Todo.dart';
import 'package:http/http.dart' as http;

Future<List<Todo>> fetchTodos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));

  if (response.statusCode == 200) {
    final List body = json.decode(response.body);
    return body.map((e) => Todo.fromJson(e)).toList();
  } else {
    throw Exception('Falha ao consultar todos list');
  }
}
