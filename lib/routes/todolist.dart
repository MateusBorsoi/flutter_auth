import 'package:app_auth/classes/Todo.dart';
import 'package:app_auth/components/menudrawer.dart';
import 'package:app_auth/repositories/api/todo_fetch.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final String title;
  const TodoList({super.key, required this.title});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
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
        child: FutureBuilder<List<Todo>>(
          future: fetchTodos(),
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
                            title: Text(snapshot.data![index].id.toString()),
                            subtitle: Text(snapshot.data![index].title),
                            trailing: Text(
                                'Completado: ${snapshot.data![index].completed == true ? 'Sim' : 'Não'}'),
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
