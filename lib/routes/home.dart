import 'package:flutter/material.dart';
import 'package:app_auth/components/menudrawer.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onSecondary,
      child: Scaffold(
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
          child: Card(
            shadowColor: Theme.of(context).colorScheme.secondary,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(15),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cadastro');
          },
          tooltip: 'Cadastro',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
