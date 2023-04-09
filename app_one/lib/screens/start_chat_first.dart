import 'package:app_one/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StartChatFirst extends StatefulWidget {
  @override
  _StartChatFirstState createState() => _StartChatFirstState();
}

class _StartChatFirstState extends State<StartChatFirst> {
  bool isTyping = false; // Track whether user is typing
  //final TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  final double appBarHeight = 70.0; // Set the desired height of the AppBar
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
              backgroundColor: Colors
                  .lightBlueAccent, // Replace with appropriate background color
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                      30), // Set the desired border radius for the AppBar
                ),
              ),
              elevation: 0.0, // Remove the AppBar shadow
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text('New Conversation',
                          style: TextStyle(fontSize: 16.0)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Container(
                    height: 30.0,
                    width: 40.0,
                    child: const Text(
                      '+91',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      keyboardType:
                          TextInputType.phone, // Set keyboard type to phone
                      //maxLength: 10, // Set maximum length to 10 digits
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number', // Update hint text
                        hintStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.blue, // Set the border color to blue
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.blue, // Set the border color to red
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        // Manually limit input length to 10 digits
                        if (_textEditingController.text.length > 10) {
                          _textEditingController.text =
                              _textEditingController.text.substring(0, 10);
                          _textEditingController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _textEditingController.text.length));
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () => '',
                    icon: const Icon(Icons.dialpad),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Stack(
                    children: [
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            isTyping =
                                text.isNotEmpty; // Update the typing flag
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Message',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color:
                                  Colors.blue, // Set the border color to blue
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.blue, // Set the border color to red
                            ),
                          ),
                        ),
                      ),
                      if (isTyping) // Show send button only when user is typing
                        Positioned(
                          bottom:
                              5, // Adjust the bottom padding for the send button
                          right:
                              0, // Adjust the right padding for the send button
                          child: ElevatedButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg: "Sending Message...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                              );
                              // Navigate to the next screen
                              Future.delayed(const Duration(seconds: 2))
                                  .then((value) async {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,

                              shape:
                                  const CircleBorder(), // Make the button circular
                              padding: const EdgeInsets.all(
                                  15), // Add padding around the icon
                            ),
                            child: const Icon(
                              Icons
                                  .send, // Icon to be displayed on the send button
                              size: 24, // Icon size
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
