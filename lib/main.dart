import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'map.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'TicPrice.dart';
import 'Schedule_List.dart';
import 'details.dart';
import 'settings.dart';
import 'mrtcard.dart';
import 'tickets.dart';
import 'card/passcard.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MRT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      backgroundColor: Colors.lightBlue[50],
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Text(
              'Welcome To Metro Rail',
              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
            ),
             SizedBox(height: 20),
             SearchBar(),
            SizedBox(height: 20),
            CarouselSliderWidget(),
            SizedBox(height: 10),
            MenuButtons(),
            // SizedBox(height: 20),
            // CarouselSliderWidget(),
            // SizedBox(height: 20),
            // features(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Your Account'),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              // Handle drawer item 1 tap
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settings()),
              );
              // Handle drawer item 2 tap
            },
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle search bar tap
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MenuButtons extends StatelessWidget {
  const MenuButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(   decoration: BoxDecoration(
      color: Colors.white, // Set the background color for menu buttons
      borderRadius: BorderRadius.circular(40) // Set the border radius
    ),// Set the background color for menu buttons
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItem(title: 'Details', imagePath: 'asset/det.jpg', page: HomePage()),
              MenuItem(title: 'Map', imagePath: 'asset/map.png', page: Map()),
              MenuItem(title: 'Ticket Price', imagePath: 'asset/mrt3.png', page: TicketPrice()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MenuItem(title: 'Schedule', imagePath: 'asset/sch.jpg', page: Schedule()),
              MenuItem(title: 'MRT Card', imagePath: 'asset/card.jpg', page: PassCardForm()),
              const MenuItem(title: 'Purchase ', imagePath: 'asset/mrt5.jpg', page: Tickets()),
            ],
          ),
        ],
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Widget page;

  const MenuItem({
    required this.title,
    required this.imagePath,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },

      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.20,
        height: MediaQuery.of(context).size.width * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            /*BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
            ),*/
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                width: double.infinity, // Match parent width
                height: double.infinity, // Match parent height
                // fit: BoxFit.cover, // Ensure the image fills the container
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: [
        'asset/caro1.jpg',
        'asset/caro2.jpg',
        'asset/caro3.jpg',
        'asset/caro4.png',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  i,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settings()),
              );
            },
          ),
        ],
      ),
    );
  }
}
class features extends StatelessWidget {
  const features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(   decoration: BoxDecoration(
      color: Colors.white, // Set the background color for menu buttons
      borderRadius: BorderRadius.circular(40), // Set the border radius
    ),// Set the background color for menu buttons
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItem(title: 'Details', imagePath: 'asset/mrt1.png', page: HomePage()),
              MenuItem(title: 'Map', imagePath: 'asset/mrt6.png', page: Map()),
              MenuItem(title: 'Ticket Price', imagePath: 'asset/mrt3.png', page: TicketPrice()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MenuItem(title: 'Schedule', imagePath: 'asset/mrt4.png', page: Schedule()),
              MenuItem(title: 'MRT Card', imagePath: 'asset/mrtic2.jpg', page: PassCardForm()),
              const MenuItem(title: 'Purchase ', imagePath: 'asset/mrt5.jpg', page: Tickets()),
            ],
          ),
        ],
      ),
    );
  }
}