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

  _checkAndNavigate() {
    // Logic to check if the input value matches the static value
    String staticValue = "1234"; // Replace with your static value
    if (inputValue == staticValue) {
      // Navigate to the next screen
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OtpScreen(
          value: '',
        ),
      ));
    } else {
      // Handle the case where the input value does not match the static value
      // ...
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
                        color: Color(0xff808d9e),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '+91 ${widget.value}',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Color(0xff005BE0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ])),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: Pinput(
                      onCompleted: _checkAndNavigate(),
                      obscureText: true,
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
