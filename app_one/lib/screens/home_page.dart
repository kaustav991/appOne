import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final double appBarHeight = 70.0; // Set the desired height of the AppBar
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const Drawer(),
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
                  color: Colors
                      .transparent, // Replace with appropriate background color for the search field
                  borderRadius: BorderRadius.circular(
                      50), // Set the desired border radius for the search field
                ),
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  children: const [
                    Expanded(
                      child: TextField(
                        cursorColor: Colors
                            .white, // Replace with the desired color for the cursor
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText:
                              'Search', // Replace with appropriate search hint text
                          border:
                              InputBorder.none, // Remove the TextField border
                          prefixIcon: Icon(Icons.search,
                              color: Colors
                                  .white), // Replace with appropriate search icon
                          // Customize the color of the input text
                          hintStyle: TextStyle(
                              color: Colors
                                  .white), // Replace with the desired color for the hint text
                          // Customize the color of the cursor
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors
                          .blue, // Replace with appropriate background color for the avatar
                      child: Icon(Icons.person,
                          color: Colors
                              .white), // Replace with appropriate icon for the avatar
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 10, // Replace with your actual message list
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors
                            .blue, // Replace with appropriate sender avatar
                        child: Text(
                            'A'), // Replace with appropriate sender initial
                      ),
                      title: const Text(
                          'Sender Name'), // Replace with appropriate sender name
                      subtitle: const Text(
                          'This is a message'), // Replace with appropriate message text
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          SizedBox(height: 10.0), // Add SizedBox for spacing
                          Text(
                            '10:30 AM', // Replace with appropriate message timestamp
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text(
            'Start Chat',
            style: TextStyle(
              fontSize: 14, // Customize the font size
              fontWeight: FontWeight.w600, // Customize the font weight
              color: Colors.white, // Customize the text color
            ),
          ),
          icon: const Icon(Icons.messenger_outline),
          backgroundColor: Colors.blue,
          splashColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
