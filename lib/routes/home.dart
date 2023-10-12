import 'package:flutter/material.dart';

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
              child: Text(widget.title.toString()),
            ),
          ),
        ),
        body: Center(
          child: Card(
            shadowColor: Theme.of(context).colorScheme.secondary,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text('Seja bem vindo(a)'),
            ),
          ),
        ),
      ),
    );
  }
}
