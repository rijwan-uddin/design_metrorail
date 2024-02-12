import 'package:design_metrorail/TicPrice.dart';
import 'package:flutter/material.dart';
import 'package:design_metrorail/Schedule_List.dart';

const metro =
'''MRT Line 6 is a  21.26km line extending from Uttara in the north to Kamalapur in the south. The line runs parallel to the Turag River in the west of Dhaka and curves as it moves south-east following the path of the Buriganga River.
The line will be a standard gauge track, including a total of 16 elevated stations crossing busy areas such as Pallabhi and Mirpur. The travel time from north to south Dhaka will be approximately 35 minutes.''';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSection(),
            _headerSection(),
            _Featuresection(),
            _bodySection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Ticket Price',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
            // Navigate to Schedule Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Schedule()),
              );
              break;
            case 1:
            // Navigate to Ticket Price Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TicketPrice()),
              );
              break;
          }
        },
        elevation: 5, // Add elevation for shadow effect
      ),
    );
  }

  Widget _bodySection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(metro),
    );
  }

  Widget _headerSection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Metro Rail',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Dhaka, Bangladesh',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            '9.5',
          )
        ],
      ),
    );
  }

  Widget _imageSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          'asset/met.jpg',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
        ),
        const Positioned(
          bottom: 150,
          right: 10,
          left: 10,
          child: Text(
            'WELCOME TO MRT',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 18,
            ),
          ),
        ),
        Positioned(
          right: 16,
          bottom: -20,
          left: 16,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.yellow,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _Featuresection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              // Perform action for CALL button
              // For example, navigate to a call functionality
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call, color: Colors.blue),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'CALL',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // Perform action for ROUTE button
              // For example, navigate to a route functionality
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.near_me, color: Colors.blue),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'ROUTE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // Perform action for SHARE button
              // For example, share functionality
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share, color: Colors.blue),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'SHARE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}



