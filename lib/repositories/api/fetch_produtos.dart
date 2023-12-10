import 'dart:convert';

import 'package:app_auth/classes/Produtos.dart';
import 'package:http/http.dart' as http;

Future<List<Produto>> fetchProdutos() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.7:5000/produtos'));

  if (response.statusCode == 200) {
    final List body = json.decode(response.body);
    return body.map((e) => Produto.fromJson(e)).toList();
  } else {
    throw Exception('Falha ao consultar produtos');
  }
}
