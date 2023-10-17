import 'dart:async';

import 'package:app_auth/db/database.dart';
import 'package:app_auth/entitys/anotation.dart';
import 'package:flutter/material.dart';
import 'package:app_auth/components/menudrawer.dart';

class Home extends StatefulWidget {
  final String title;
  final AppDatabase database;

  const Home({super.key, required this.title, required this.database});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void removerTarefa(int? id) async {
    Completer<void> completer = Completer<void>();
    if (id != null) {
      await widget.database.anotationDao.removeAnotationById(id);
    }
    completer.complete();
    completer.future.then((_) {
      Navigator.pushNamed(context, '/home');
    });
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
            child: FutureBuilder<List<Anotation>>(
          future: widget.database.anotationDao.getAllAnotation(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 5),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 400,
                              child: Card(
                                child: ListTile(
                                  title: Text(snapshot.data![index].titulo),
                                  subtitle:
                                      Text(snapshot.data![index].observacao),
                                  trailing: PopupMenuButton(
                                    onSelected: (value) {
                                      if (value == 'remover') {
                                        removerTarefa(snapshot.data![index].id);
                                      }
                                    },
                                    itemBuilder: (BuildContext bc) {
                                      return const [
                                        PopupMenuItem(
                                          value: 'remover',
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 12),
                                                child: Icon(Icons.delete),
                                              ),
                                              Text("Remover")
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'editar',
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 12),
                                                child: Icon(Icons.edit),
                                              ),
                                              Text("Editar")
                                            ],
                                          ),
                                        ),
                                      ];
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('Sem registro(s)'),
                  );
          },
        )),
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
