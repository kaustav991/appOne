import 'package:app_one/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Please Enter code that we have sent you',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Color(0xff808d9e),
                        fontWeight: FontWeight.w400,
                      ))
                ]))
              ]),
        ),
      ),
    );
  }
}
