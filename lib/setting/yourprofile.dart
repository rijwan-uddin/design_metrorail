/*import 'dart:io';
import 'package:flutter/material.dart';
import 'editprofile.dart';


class ProfilePage extends StatelessWidget {
  final String initialName;
  final String initialPhoneNumber;
  final String initialEmail;
  final String initialHomeAddress;
  final String initialImageUrl;

  const ProfilePage({
    Key? key,
    required this.initialName,
    required this.initialPhoneNumber,
    required this.initialEmail,
    required this.initialHomeAddress,
    required this.initialImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePageEdit(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: initialImageUrl.isNotEmpty
                      ? FileImage(File(initialImageUrl))
                      : AssetImage('assets/default_avatar.png') as ImageProvider<Object>,
                  child: initialImageUrl.isEmpty
                      ? Icon(Icons.person, size: 50)
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Text('Name: $initialName', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text('Phone Number: $initialPhoneNumber', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text('Email: $initialEmail', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text('Home Address: $initialHomeAddress', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'editprofile.dart';


class ProfilePage extends StatelessWidget {
  final String initialName;
  final String initialPhoneNumber;
  final String initialEmail;
  final String initialHomeAddress;
  final String initialImageUrl;

  const ProfilePage({
    Key? key,
    required this.initialName,
    required this.initialPhoneNumber,
    required this.initialEmail,
    required this.initialHomeAddress,
    required this.initialImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePageEdit(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: initialImageUrl.isNotEmpty
                        ? FileImage(File(initialImageUrl))
                        : AssetImage(
                        'assets/default_avatar.png') as ImageProvider<Object>,
                    child: initialImageUrl.isEmpty
                        ? Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildInfoCard('Name', initialName),
              SizedBox(height: 20),
              buildInfoCard('Phone Number', initialPhoneNumber),
              SizedBox(height: 20),
              buildInfoCard('Email', initialEmail),
              SizedBox(height: 20),
              buildInfoCard('Home Address', initialHomeAddress),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String info) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              info,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}