import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String title;

  const Login({super.key, required this.title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onSecondary,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
            child: Text(widget.title.toString()),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  "lib/assets/images/img_logo.png",
                  width: 150,
                ),
              ),
            ),
            SizedBox(
              width: 350,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                      controller: user,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Usuário'),
                    ),
                  ),
                  TextField(
                    controller: password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Senha'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: const Text('Entrar'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
