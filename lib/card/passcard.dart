import 'package:flutter/material.dart';
import 'package:design_metrorail/mrtcard.dart';

class PassCard extends StatelessWidget {
  final String name;
  final String dob;
  final String nid;
  final String phone;

  PassCard(this.name, this.dob, this.nid, this.phone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metro Rail PassCard'),
      ),
      body: Center(
        child: SizedBox(
          width: 300, // Adjust the width as needed
          height: 180, // Adjust the height as needed
          child: Card(
            elevation: 15, // Elevation added here
            color: Colors.black, // Color set to black
            // Define the shape of the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'asset/card.png',
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            const Text(
                              "Metro Rail PassCard",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Add a subtitle widget
                            Text(
                              "Valid Until: 2025",
                              style: TextStyle(
                                fontSize: 14, // Adjust subtitle font size
                                color: Colors.grey[500],
                              ),
                            ),
                            const SizedBox(height: 10),

                            Text(
                              "Name: $name\nDate of Birth: $dob\nNID Number: $nid\nPhone Number: $phone",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


