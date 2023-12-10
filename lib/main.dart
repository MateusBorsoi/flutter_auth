import 'package:app_auth/db/database.dart';
import 'package:app_auth/routes/cadastrarProduto.dart';
import 'package:app_auth/routes/cadastro.dart';
import 'package:app_auth/routes/home.dart';
import 'package:app_auth/routes/listaProdutos.dart';
import 'package:app_auth/routes/login.dart';
import 'package:app_auth/routes/todolist.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_auth.db').build();
  runApp(AppAuth(database: database));
}

class AppAuth extends StatefulWidget {
  final AppDatabase database;

  const AppAuth({super.key, required this.database});

  @override
  State<AppAuth> createState() => _AppAuthState();
}

class _AppAuthState extends State<AppAuth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(title: 'Login'),
        '/home': (context) => Home(
              title: 'Home',
              database: widget.database,
              key: UniqueKey(),
            ),
        '/cadastro': (context) => Cadastro(
              title: 'Cadastro',
              database: widget.database,
              key: UniqueKey(),
            ),
        '/todolist': (context) => const TodoList(title: 'Todo List'),
        '/listaProdutos': (context) =>
            const ListaProdutos(title: 'Lista Produtos'),
        '/cadastrarProduto': (context) =>
            const CadastrarProduto(title: 'Cadastrar Produto'),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurpleAccent.shade700,
            brightness: Brightness.light),
      ),
    );
  }
}
