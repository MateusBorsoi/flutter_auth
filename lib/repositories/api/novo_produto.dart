import 'dart:convert';

import 'package:app_auth/classes/Produtos.dart';
import 'package:http/http.dart' as http;

Future<http.Response> novoProduto(Produto produto) {
  return http.post(
    Uri.parse('http://192.168.1.7:5000/produtos'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'complemento': produto.complemento,
      'descricao': produto.descricao,
      'imagens': produto.imagens,
      'preco': produto.preco,
      'promocional': produto.promocional,
      'quantidade': produto.quantidade
    }),
  );
}
