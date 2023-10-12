import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  final String title;

  const DrawerMenu({super.key, required this.title});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.title),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Card(
                  shadowColor: Theme.of(context).colorScheme.secondary,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('Seja bem vindo(a)'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
