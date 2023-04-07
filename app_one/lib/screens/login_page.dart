import 'package:app_one/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String fetchedName = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    setState(() {
      changeButton = true;
    });

    Fluttertoast.showToast(
      msg: "Generating the OTP...",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 10,
    );
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, ApponeRoutes.otpRoute,
          arguments: fetchedName);
    });
    setState(() {
      changeButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
              height: 300,
            ),
            const Text(
              // "Hi $fetchedName, Login Here",
              "Sign up to Explore",
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
                  setState(() {});
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Phone Number To Get OTP',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Username Cannot be empty");
                  }
                  return null;
                },
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            //   child: TextFormField(
            //     obscureText: true,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Enter Your Password',
            //     ),
            //     validator: (value) {
            //       if (value!.isEmpty) {
            //         return ("Password Cannot be empty");
            //       }
            //       if (value!.isEmpty) {
            //         return ("Password Cannot be empty");
            //       }
            //       return null;
            //     },
            //   ),
            // ),
            const SizedBox(
              height: 20.0,
            ),
            Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
              child: InkWell(
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: changeButton ? 50 : 150,
                  height: 50,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //     ),
                  child: changeButton
                      ? const Icon(Icons.done, color: Colors.white)
                      : const Text(
                          "Get OTP",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
