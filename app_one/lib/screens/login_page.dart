import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset('assets/images/login.png'),
        FittedBox(
          fit: BoxFit.contain,
        ),
        Text(
          'Login Here',
          style: TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
