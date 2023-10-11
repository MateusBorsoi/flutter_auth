import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AppAuth(
      title: 'Login',
    ),
  ));
}

class AppAuth extends StatefulWidget {
  final String title;

  const AppAuth({super.key, required this.title});

  @override
  State<AppAuth> createState() => _AppAuthState();
}

class _AppAuthState extends State<AppAuth> {
  final user = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                          onPressed: () {}, child: const Text('Entrar'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
