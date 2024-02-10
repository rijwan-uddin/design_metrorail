import 'package:flutter/material.dart';

class TicketPrice extends StatefulWidget {
  const TicketPrice({Key? key}) : super(key: key);

  @override
  _TicketPriceState createState() => _TicketPriceState();
}

class _TicketPriceState extends State<TicketPrice> {
  String? fromValue;
  String? toValue;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // List of locations
    List<String> locations = [
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Price'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'From',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // Adjust font size based on screen width
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'To',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // Adjust font size based on screen width
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  hint: Text('Select from list'),
                  value: fromValue,
                  items: locations.map((String location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      fromValue = value;
                    });
                  },
                ),
                SizedBox(width: 20),
                DropdownButton<String>(
                  hint: Text('Select from list'),
                  value: toValue,
                  items: locations.map((String location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      toValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add your other widgets here if needed
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

