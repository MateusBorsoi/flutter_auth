import 'dart:async';

import 'package:app_auth/db/database.dart';
import 'package:app_auth/entitys/anotation.dart';
import 'package:flutter/material.dart';
import 'package:app_auth/components/menudrawer.dart';

class Cadastro extends StatefulWidget {
  final String title;
  final AppDatabase database;
  const Cadastro({super.key, required this.title, required this.database});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final tituloController = TextEditingController();
  final obsController = TextEditingController();

  void cadastrarTarefa() async {
    Completer<void> completer = Completer<void>();

    if (tituloController.text.isNotEmpty && obsController.text.isNotEmpty) {
      await widget.database.anotationDao.insertItem(
        Anotation(
            observacao: obsController.text, titulo: tituloController.text),
      );

      completer.complete();
      completer.future.then((_) {
        Navigator.pushNamed(context, '/home');
      });
    }
  }

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
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Center(
                          child: Text('Cadastro de Tarefa',
                              style: TextStyle(
                                  fontSize: 25,
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TextField(
                          controller: tituloController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    tituloController.clear();
                                  },
                                  icon: const Icon(Icons.close)),
                              border: const OutlineInputBorder(),
                              labelText: 'Título'),
                        ),
                      ),
                      TextField(
                        controller: obsController,
                        maxLines: 8,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  obsController.clear();
                                },
                                icon: const Icon(Icons.close)),
                            border: const OutlineInputBorder(),
                            labelText: 'Observação'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            cadastrarTarefa();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
