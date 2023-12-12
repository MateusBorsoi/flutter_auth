class Produto {
  final int id;
  final String descricao;
  final String preco;
  final String imagens;
  final String complemento;
  final String promocional;
  final String quantidade;

  Produto(
      {required this.id,
      required this.descricao,
      required this.preco,
      required this.imagens,
      required this.promocional,
      required this.complemento,
      required this.quantidade});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'descricao': String descricao,
        'preco': String preco,
        'imagens': String imagens,
        'complemento': String complemento,
        'promocional': String promocional,
        'quantidade': String quantidade
      } =>
        Produto(
            id: id,
            descricao: descricao,
            preco: preco,
            imagens: imagens,
            complemento: complemento,
            promocional: promocional,
            quantidade: quantidade),
      _ => throw const FormatException('Falha ao carregar produtos'),
    };
  }
}
