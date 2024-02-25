
import 'dart:io';
import 'package:flutter/material.dart';
import 'editprofile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _homeAddress = '';
  String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              // Navigate to ProfilePageEdit and wait for result
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePageEdit()),
              );

              // Update profile details if result is not null
              if (result != null) {
                setState(() {
                  _name = result['name'];
                  _phoneNumber = result['phoneNumber'];
                  _email = result['email'];
                  _homeAddress = result['homeAddress'];
                  _imageUrl = result['imageUrl'];
                });
              }
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
                  backgroundImage: _imageUrl.isNotEmpty
                      ? FileImage(File(_imageUrl))
                      : AssetImage('assets/default_avatar.png') as ImageProvider<Object>,
                  child: _imageUrl.isEmpty ? Icon(Icons.person, size: 50) : null,
                ),
              ),
              SizedBox(height: 20),
              buildInfoCard('Name', _name),
              SizedBox(height: 20),
              buildInfoCard('Phone Number', _phoneNumber),
              SizedBox(height: 20),
              buildInfoCard('Email', _email),
              SizedBox(height: 20),
              buildInfoCard('Home Address', _homeAddress),
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
