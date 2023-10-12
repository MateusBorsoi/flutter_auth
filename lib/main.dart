import 'package:app_auth/routes/home.dart';
import 'package:app_auth/routes/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(title: 'Login'),
        '/home': (context) => const Home(
              title: 'Home',
            )
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurpleAccent.shade700,
            brightness: Brightness.light),
      ),
    ),
  );
}
