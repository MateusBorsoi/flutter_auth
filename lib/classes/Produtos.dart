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
    return Produto(
        id: json['id'],
        descricao: json['descricao'],
        preco: json['preco'],
        imagens: json['imagens'],
        complemento: json['complemento'],
        promocional: json['promocional'],
        quantidade: json['quantidade']);
  }
}
