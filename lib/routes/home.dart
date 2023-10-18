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
  final editTituloController = TextEditingController();
  final editAnotationController = TextEditingController();

  void removerTarefa(Anotation anotation) async {
    await widget.database.anotationDao.deleteItem(anotation);
    setState(() {
      Navigator.pop(context);
    });
  }

  void atualizarTarefa(int? id) async {
    if (editAnotationController.text.isNotEmpty &&
        editTituloController.text.isNotEmpty) {
      Anotation anotation = Anotation(
          id: id,
          observacao: editAnotationController.text,
          titulo: editTituloController.text);
      await widget.database.anotationDao.updateItem(anotation);
      setState(() {
        Navigator.pop(context);
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
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title:
                                                const Text('Remover anotação'),
                                            content: const Text(
                                                'Deseja realmente remover esta anotação ?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancelar'),
                                                child: const Text('Cancelar'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  removerTarefa(
                                                      snapshot.data![index]);
                                                },
                                                child: const Text('Confirmar'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      if (value == 'editar') {
                                        editAnotationController.text =
                                            snapshot.data![index].observacao;
                                        editTituloController.text =
                                            snapshot.data![index].titulo;

                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title:
                                                const Text('Editar anotação'),
                                            content: SizedBox(
                                              height: 300,
                                              width: 400,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25),
                                                    child: TextField(
                                                      controller:
                                                          editTituloController,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Titulo',
                                                      ),
                                                    ),
                                                  ),
                                                  TextField(
                                                    maxLines: 4,
                                                    controller:
                                                        editAnotationController,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      labelText: 'Observação',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancelar'),
                                                child: const Text('Cancelar'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  atualizarTarefa(
                                                      snapshot.data![index].id);
                                                },
                                                child: const Text('Confirmar'),
                                              ),
                                            ],
                                          ),
                                        );
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
