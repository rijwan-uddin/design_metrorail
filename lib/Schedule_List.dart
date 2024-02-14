import 'package:flutter/material.dart';
import 'package:design_metrorail/main.dart';
class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: ListView(
        children: const [
          Positioned(
            right: 40,
            child: Text(
              'Saturday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: 6,

            child: Text(
              'Sunday',
             // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: 8,
            child: Text(
              'Monday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: 8,
            child: Text(
              'Tuesday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: 8,
            child: Text(
              'Wednesday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: 8,
            child: Text(
              'Thursday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: 8,
            child: Text(
              'Friday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to settings page or perform settings-related functionality
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Add your settings button functionality here
              },
            ),
          ],
        ),
      ),  //add
    );
  }
}
