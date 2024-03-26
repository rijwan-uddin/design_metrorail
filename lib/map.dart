import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),

      body: const Column(
        children: [
          Center(
            child: Text(
              'Locations of each metro stations',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold

              ),

            ),
          )
        ],
      ),
    );
  }
}
