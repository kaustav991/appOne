import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String fetchedName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard '),
      ),
      body: Center(
        child: Text('Welcome $fetchedName'),
      ),
      drawer: const Drawer(),
    );
  }
}
