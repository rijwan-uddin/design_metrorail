import 'package:design_metrorail/TicPrice.dart';
import 'package:flutter/material.dart';
import 'package:design_metrorail/Schedule_List.dart';
import 'package:design_metrorail/landingPage.dart';
import 'package:design_metrorail/details.dart';


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


class bottomnavBar extends StatefulWidget {
  const bottomnavBar({Key? key}) : super(key: key);

  @override
  State<bottomnavBar> createState() => _landingPageState();
}

class _landingPageState extends State<bottomnavBar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Metro'),
    Text('Search'),
    Text('Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildNavBarItem(0, Icons.home, "Home"),
              buildNavBarItem(1, Icons.directions_subway, "Metro"),
              SizedBox(width: 50), // SizedBox to create space for FAB
              buildNavBarItem(2, Icons.search, "Search"),
              buildNavBarItem(3, Icons.settings, "Settings"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavBarItem(int index, IconData icon, String label) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _onItemTapped(index);
        },
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _selectedIndex == index ? Colors.blue : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: _selectedIndex == index ? Colors.white : Colors.blue,
              ),
              SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
