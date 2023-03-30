import 'package:app_one/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

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
        child: Column(children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
            height: 300,
          ),
          Text(
            "Hi $fetchedName, Login Here",
            style: const TextStyle(
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
            child: TextField(
              onChanged: (val) {
                fetchedName = val;
                setState(() {});
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Email or Phone Number',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Password',
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              style: TextButton.styleFrom(minimumSize: const Size(200, 40)),
              onPressed: () async {
                Fluttertoast.showToast(
                  msg: "Logging you in...",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 10,
                );
                Future.delayed(Duration(seconds: 4), () {
                  Navigator.pushNamed(context, ApponeRoutes.homeRoute,
                      arguments: fetchedName);
                });
              },
              child: Text('Login'))
        ]),
      ),
    );
  }
}
