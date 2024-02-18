import 'package:flutter/material.dart';
import 'package:design_metrorail/main.dart';
import 'settings.dart';
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
            bottom: 20,
            child: Text(
              'Saturday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 20,

            child: Text(
              'Sunday',
             // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text(
              'Monday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text(
              'Tuesday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text(
              'Wednesday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text(
              'Thursday',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
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
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settings()),
              );
                // Add your settings button functionality here
              },
            ),
          ],
        ),
      ),  //add
    );
  }
}
