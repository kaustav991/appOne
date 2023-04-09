import 'package:app_one/screens/home_page.dart';
import 'package:app_one/screens/login_page.dart';
import 'package:app_one/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String value;
  const OtpScreen({super.key, required this.value});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String inputValue = ""; // State to hold the input value

  int maxAttempts = 3; // Maximum number of allowed attempts
  int incorrectAttempts = 0; // Counter for incorrect attempts

  void _checkAndNavigate(String input, BuildContext context) {
    String staticValue = "1234"; // Replace with your static value
    if (input == staticValue) {
      Fluttertoast.showToast(
        msg: "OTP verified. Redirecting...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      // Navigate to the next screen
      Future.delayed(const Duration(seconds: 2)).then((value) async {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      });
    } else {
      incorrectAttempts++; // Increment incorrect attempts counter
      int attemptsRemaining = maxAttempts - incorrectAttempts;
      if (attemptsRemaining > 0) {
        // Show error message with attempts remaining
        Fluttertoast.showToast(
          msg:
              "Incorrect verification code. $attemptsRemaining attempt(s) remaining.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      } else {
        // If max attempts reached, navigate back to home page
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        //key: _formKey,
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: Text(
                    'Verification Code',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 32.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Please Enter code that we have sent you at ',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: const Color(0xff808d9e),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '${widget.value}',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: const Color(0xff005BE0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: Pinput(
                      onChanged: (input) {
                        setState(() {
                          inputValue =
                              input; // Update the inputValue with the current input
                        });
                      },
                      onCompleted: (input) {
                        _checkAndNavigate(input,
                            context); // Pass both input and context arguments
                      },
                      // onCompleted: (input) =>
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => LoginPage(),
                      // )),
                      // _checkAndNavigate(input),
                      obscureText: true,
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle 'Resend OTP' click here
                          // Redirect to home
                        },
                        child: Text(
                          'Resend OTP',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                          // Handle 'Not getting OTP? Go Back and Check the number' click here
                          // Redirect to home
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              vertical: 15.0),
                          child: Text(
                            'Not getting OTP? Go Back and Check the number',
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: const Color(0xff005BE0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
