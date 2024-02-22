import 'package:flutter/material.dart';
import 'package:design_metrorail/main.dart';
import 'settings.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  final List<String> stationNames = const [
    'Uttara North',
    'Uttara Center',
    'Uttara South',
    'Pallabi',
    'Mirpur11',
    'Mirpur10',
    'Kazipara',
    'Shewrapara',
    'Agargaon',
    'Bijoysaraoni',
    'Farmgate',
    'Kawranbazar',
    'Shahbagh',
    'Dhaka University',
    'Sochibaloy',
    'Motijhil',
    'Komlapur',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: ListView.builder(
        itemCount: stationNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                _showPopup(context, stationNames[index]);
              },
              style: ElevatedButton.styleFrom(
                elevation: 5, // Add shadow
                primary: Colors.white, // Button color
                minimumSize: Size(double.infinity, 50), // Set button size
                alignment: Alignment.centerLeft, // Align text to the left
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0), // Adjust text alignment within the button
                child: Text(
                  stationNames[index],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to home page or perform home-related functionality
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings page or perform settings-related functionality
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const settings()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPopup(BuildContext context, String stationName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Button Clicked'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$stationName button clicked!'),
              SizedBox(height: 20),
              Table(
                border: TableBorder.all(),
                children: List.generate(
                  6,
                      (index) => TableRow(
                    children: List.generate(
                      6,
                          (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cell ${index + 1},${index + 1}',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
