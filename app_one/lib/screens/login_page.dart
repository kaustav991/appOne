import 'package:app_one/utils/router.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String fetchedName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
            height: 300,
          ),
          const Text(
            'Login Here',
            style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: TextFormField(
              onChanged: (val) {
                fetchedName = val;
                setState(() {
                  
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter Your Email or Phone Number',
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Enter Your Password',
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              style: TextButton.styleFrom(minimumSize: const Size(200, 40)),
              onPressed: () {
                Navigator.pushNamed(context, ApponeRoutes.homeRoute);
              },
              child: Text('Login'))
        ],
      ),
    ));
  }
}
