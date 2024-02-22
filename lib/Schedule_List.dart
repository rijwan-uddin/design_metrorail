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
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                _showPopup(context, stationNames[index]);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue.withOpacity(0.5), // Transparent light blue background color
                minimumSize: Size(double.infinity, 60), // Set button size
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: 5.0, // Add shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Make buttons more curved
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    stationNames[index],
                    style: TextStyle(color: Colors.black),
                  ),
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
          content: Text(
              'Station: $stationName : in peak time train will arrive after 8 minutes and off-peak time it will be 10 minutes. Offday: Friday '),
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
