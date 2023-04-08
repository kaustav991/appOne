import 'package:app_one/screens/otp_screen.dart';
// import 'package:app_one/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:libphonenumber/libphonenumber.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String fetchedName = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool validatePhoneNumber(String phoneNumber) {
    final phoneRegex =
        RegExp(r'^\+?\d{10,15}$'); // Update regex as per your requirement
    return phoneRegex.hasMatch(phoneNumber);
  }

  void handleGetOTP(BuildContext context) async {
    // Validate phone field
    if (fetchedName.isEmpty) {
      Fluttertoast.showToast(
        msg: "Phone Number field is required.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      bool isValidPhoneNumber = validatePhoneNumber(fetchedName);
      if (isValidPhoneNumber) {
        setState(() {
          changeButton = true;
        });

        Fluttertoast.showToast(
          msg: "Generating the OTP...",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
        );

        await Future.delayed(const Duration(seconds: 4)).then((value) async {
          setState(() {
            changeButton = false;
          });
          // Perform action after phone field is not empty and phone number is valid
          // For example, you can call an API to get OTP
          // Move to home screen after getting OTP
          moveToHome(context);
        });
      } else {
        Fluttertoast.showToast(
          msg: "Please enter a valid phone number.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }

  void moveToHome(BuildContext context) async {
    // Code to move to home page
    // You can replace this with your own implementation
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OtpScreen(value: fetchedName),
    ));
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
              child: IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(),
                  // ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  setState(() {
                    fetchedName = phone.completeNumber;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
              child: InkWell(
                // onTap: () => moveToHome(context),
                onTap: () => handleGetOTP(context), // Handle button tap
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
