import 'package:app_auth/components/dropDown.dart';
import 'package:app_auth/components/menudrawer.dart';
import 'package:flutter/material.dart';
import 'package:image_field/image_field.dart';

class CadastrarProduto extends StatefulWidget {
  final String title;
  const CadastrarProduto({super.key, required this.title});

  @override
  State<CadastrarProduto> createState() => _CadastrarProdutoState();
}

class _CadastrarProdutoState extends State<CadastrarProduto> {
  final descricao = TextEditingController();
  final complemento = TextEditingController();
  dynamic remoteFiles;
  final categoria = TextEditingController();
  final preco = TextEditingController();
  final quantidade = TextEditingController();
  final promocional = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(widget.title),
          ),
        ),
      ),
      drawer: const DrawerMenu(title: 'Menu'),
      body: Form(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text('Cadastro de produto'),
            ),
            SizedBox(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 12, top: 12, left: 12, right: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextField(
                        controller: descricao,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Descrição'),
                      ),
                    ),
                    TextField(
                      controller: complemento,
                      maxLines: 4,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Complemento'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Flexible(
                            child: DropDownLista(
                              list: ['Computador', 'Periférico', 'Variado'],
                              label: 'Categoria',
                              width: 230,
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 150,
                              child: TextField(
                                controller: quantidade,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Quantidade'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: SizedBox(
                              width: 190,
                              child: TextField(
                                controller: preco,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Preço'),
                              ),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 190,
                              child: TextField(
                                controller: promocional,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Promocional'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ImageField(
                        texts: const {
                          'fieldFormText': 'Importar imagem',
                          'titleText': 'Importar imagem'
                        },
                        onSave: (List<ImageAndCaptionModel>?
                            imageAndCaptionList) {},
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
