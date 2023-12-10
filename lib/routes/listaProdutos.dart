import 'package:app_auth/classes/Produtos.dart';
import 'package:app_auth/components/menudrawer.dart';
import 'package:app_auth/repositories/api/fetch_produtos.dart';
import 'package:flutter/material.dart';

class ListaProdutos extends StatefulWidget {
  final String title;
  const ListaProdutos({super.key, required this.title});

  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
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
      body: Center(
        child: FutureBuilder<List<Produto>>(
          future: fetchProdutos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      color: Colors.white,
                      child: Center(
                        child: Card(
                          child: ListTile(
                            title: Text(
                                'Codigo: ${snapshot.data![index].id.toString()}'),
                            subtitle: Text(snapshot.data![index].descricao),
                            trailing: Text(
                                'Valor: ${double.parse(snapshot.data![index].preco)} R\$'),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
