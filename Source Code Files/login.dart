import 'package:flutter/material.dart';
import 'sample.dart'; // Importing the next page
import 'date&time.dart'; // Importing seventh screen

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Login',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimeAndDatePage(),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}



