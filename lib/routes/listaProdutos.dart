import 'package:app_auth/components/menudrawer.dart';
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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
            child: Text(widget.title),
          ),
        ),
        drawer: const DrawerMenu(title: 'Menu'),
        body: SizedBox(
          child: TextButton(child: const Text('Teste'), onPressed: () => ()),
        ),
      ),
    );
  }
}
