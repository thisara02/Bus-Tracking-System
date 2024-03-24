import 'package:flutter/material.dart';
import 'second.dart'; // Importing second screen
import 'third.dart'; // Importing third screen


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fixing the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EASY BUS',
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.yellow[100], // Set background color to light yellow
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange, // Setting orange color to AppBar
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/1.jpg', // Path to the image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20), // Adding some space between image and buttons
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color:
                        Color.fromARGB(255, 221, 212, 130)), // Setting yellow outline for the button
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SecondPage(), // Navigate to second.dart
                  ),
                );
              },
              child: Text(
                'I\'m a member',
                style: TextStyle(color: Colors.black), // Setting text color
              ),
            ),
            SizedBox(height: 20), // Adding some space between buttons
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color:
                        Colors.yellow), // Setting yellow outline for the button
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdPage(), // Navigate to third.dart
                  ),
                );
              },
              child: Text(
                'I haven\'t account',
                style: TextStyle(color: Colors.black), // Setting text color
              ),
            ),
            SizedBox(height: 20), // Adding some space between buttons
            ElevatedButton( // New button for ADMIN
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admin(), // Navigate to admin.dart
                  ),
                );
              },
              child: Text(
                'ADMIN',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Center(
        child: Text(
          'Welcome ADMIN',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

