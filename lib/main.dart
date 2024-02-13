import 'package:flutter/material.dart';

import 'package:design_metrorail/TicPrice.dart';
import 'package:flutter/material.dart';
import 'package:design_metrorail/Schedule_List.dart';

import 'package:design_metrorail/details.dart';
import 'package:design_metrorail/main.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

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
              // Add your notification button functionality here
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Drawer Item 1'),
              onTap: () {
                // Add your drawer item 1 functionality here
              },
            ),
            ListTile(
              title: const Text('Drawer Item 2'),
              onTap: () {
                // Add your drawer item 2 functionality here
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  // Add your drawer open functionality here
                },
              ),
              const Text(
                'MRT',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 50),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerButton(
                      title: 'Details',
                      page: HomePage(),
                    ),
                    ContainerButton(
                      title: 'Map',
                      page: Schedule(),
                    ),
                    ContainerButton(
                      title: 'Ticket Price',
                      page: TicketPrice(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const ContainerButton(
                      title: 'Schedule',
                      page: Schedule(),
                    ),
                    ContainerButton(title: '', page: Container()),
                    ContainerButton(title: '', page: Container()),
                  ],
                ),
              ],
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
                // Add your home button functionality here
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Add your settings button functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final String title;
  final Widget page;

  const ContainerButton({
    required this.title,
    required this.page,
  });

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
        width: 80,
        height: 106,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
