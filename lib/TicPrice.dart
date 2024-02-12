import 'package:flutter/material.dart';

class TicketPrice extends StatefulWidget {
  const TicketPrice({Key? key}) : super(key: key);

  @override
  _TicketPriceState createState() => _TicketPriceState();
}

class _TicketPriceState extends State<TicketPrice> {
  String? fromValue;
  String? toValue;
  double fare = 0.0;

  // Map to store fares for each location pair
  Map<String, Map<String, double>> fares = {
    'Uttara North': {
      'Uttara Center': 10.0,
      'Uttara South': 15.0,
      'Pallabi': 20.0,
      'Mirpur11':20,
      'Mirpur10':20,
      'Kazipara':30,
      'Shewrapara':30,
      'Agargaon':40,
      'Bijoysaraoni':50,
      'Farmgate':60,
      'Kawranbazar':70,
      'Shahbagh':70,
      'Dhaka University':80,
      'Sochibaloy':90,
      'Motijhil':100,
      'Komlapur':100,
      // Add fares for other locations
    },
    'Uttara Center': {
      'Uttara North': 10.0,
      'Uttara South': 15.0,
      'Pallabi': 20.0,
      'Mirpur11':20,
      'Mirpur10':20,
      'Kazipara':30,
      'Shewrapara':30,
      'Agargaon':40,
      'Bijoysaraoni':50,
      'Farmgate':60,
      'Kawranbazar':70,
      'Shahbagh':70,
      'Dhaka University':80,
      'Sochibaloy':90,
      'Motijhil':100,
      'Komlapur':100,
      // Add fares for other locations
    },
    'Uttara South': {
      'Uttara North': 10.0,
      'Uttara Center': 15.0,
      'Pallabi': 20.0,
      'Mirpur11':20,
      'Mirpur10':20,
      'Kazipara':30,
      'Shewrapara':30,
      'Agargaon':40,
      'Bijoysaraoni':50,
      'Farmgate':60,
      'Kawranbazar':70,
      'Shahbagh':70,
      'Dhaka University':80,
      'Sochibaloy':90,
      'Motijhil':100,
      'Komlapur':100,
      // Add fares for other locations
    },
    'pallabi':{
      'Uttara North': 10.0,
      'Uttara Center': 15.0,
      'Uttara South':30,
      'Mirpur11':20,
      'Mirpur10':20,
      'Kazipara':30,
      'Shewrapara':30,
      'Agargaon':40,
      'Bijoysaraoni':50,
      'Farmgate':60,
      'Kawranbazar':70,
      'Shahbagh':70,
      'Dhaka University':80,
      'Sochibaloy':90,
      'Motijhil':100,
      'Komlapur':100,


    },
    'Mirpur11':{
      'Uttara North': 10.0,
      'Uttara Center': 15.0,
      'Uttara South':30,
      'Pallabi':20,
      'Mirpur10':20,
      'Kazipara':30,
      'Shewrapara':30,
      'Agargaon':40,
      'Bijoysaraoni':50,
      'Farmgate':60,
      'Kawranbazar':70,
      'Shahbagh':70,
      'Dhaka University':80,
      'Sochibaloy':90,
      'Motijhil':100,
      'Komlapur':100,


    },
    'Mirpur10':{
      'Uttara North': 10.0,
      'Uttara Center': 15.0,
      'Uttara South':30,
      'Pallabi':20,
      'Mirpur11':20,
      'Kazipara':30,
      'Shewrapara':30,
      'Agargaon':40,
      'Bijoysaraoni':50,
      'Farmgate':60,
      'Kawranbazar':70,
      'Shahbagh':70,
      'Dhaka University':80,
      'Sochibaloy':90,
      'Motijhil':100,
      'Komlapur':100,


    },
    'Kazipara':{
      'Uttara North': 10.0,
      'Uttara Center': 15.0,
      'Uttara South':30,
      'Pallabi':20,
      'Mirpur11':20,
      'Mirpur10':30,
      
      'Shewrapara':30,
      'Agargaon':40,
      'Bijoysaraoni':50,
      'Farmgate':60,
      'Kawranbazar':70,
      'Shahbagh':70,
      'Dhaka University':80,
      'Sochibaloy':90,
      'Motijhil':100,
      'Komlapur':100,


    },
    // Add fares for other locations
  };

  bool isConfirmationVisible = false;

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
      // Add other locations
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
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'From',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
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
                      fontSize: screenWidth * 0.05,
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
                  items: locations
                      .where((location) => location != toValue)
                      .map((String location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      fromValue = value;
                      isConfirmationVisible = false;
                    });
                  },
                ),
                SizedBox(width: 20),
                DropdownButton<String>(
                  iconEnabledColor: Colors.green,
                  hint: Text('Select from list'),
                  value: toValue,
                  items: locations
                      .where((location) => location != fromValue)
                      .map((String location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      toValue = value;
                      isConfirmationVisible = false;
                    });
                  },
                ),
              ],
            ),
          ),
          if (fromValue != null && toValue != null)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fare = fares[fromValue!]![toValue!]!;
                  isConfirmationVisible = true;
                });
              },
              child: Text('Confirm'),
            ),
          if (isConfirmationVisible)
            Container(

              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.lime,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Fare from $fromValue to $toValue: $fare',
                style: TextStyle(fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }
}

