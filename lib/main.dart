import 'package:app_auth/routes/cadastro.dart';
import 'package:app_auth/routes/home.dart';
import 'package:app_auth/routes/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppAuth());
}

class AppAuth extends StatefulWidget {
  const AppAuth({super.key});

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
        '/home': (context) => const Home(
              title: 'Home',
            ),
        '/cadastro': (context) => const Cadastro(title: 'Cadastro')
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
