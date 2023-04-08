import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to disable the back button press
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Home'),
        // ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              Text(
                'Welcome to the Home Page!',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 16.0),
              Image.asset(
                'assets/images/login.png', // Replace with your image asset path
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here for button click
                    },
                    child: const Text('Button 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here for button click
                    },
                    child: const Text('Button 2'),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      10, // Replace with the number of items in your list
                  itemBuilder: (context, index) {
                    // Replace with your list item widget
                    return ListTile(
                      title: Text('List Item $index'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
