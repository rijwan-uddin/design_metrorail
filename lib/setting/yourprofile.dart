import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _homeAddress = '';
  String _imageUrl = '';

  // Method to handle image selection from gallery
  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageUrl = pickedFile.path;
      });
    }
  }

  // Method to save profile details
  void _saveProfile() {
    // Implement saving profile details to backend or local storage
    // You can access _name, _phoneNumber, _email, _homeAddress, _imageUrl here
    // For example:
    print('Name: $_name');
    print('Phone Number: $_phoneNumber');
    print('Email: $_email');
    print('Home Address: $_homeAddress');
    print('Image URL: $_imageUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: IconButton(
                  icon: _imageUrl.isNotEmpty
                      ? CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(File(_imageUrl)),
                  )
                      : CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.add_a_photo),
                  ),
                  onPressed: _getImageFromGallery,
                ),
              ),
              SizedBox(height: 20),
              Text('Name', style: TextStyle(fontSize: 16)),
              TextFormField(
                onChanged: (value) {
                  _name = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 20),
              Text('Phone Number', style: TextStyle(fontSize: 16)),
              TextFormField(
                onChanged: (value) {
                  _phoneNumber = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              SizedBox(height: 20),
              Text('Email', style: TextStyle(fontSize: 16)),
              TextFormField(
                onChanged: (value) {
                  _email = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 20),
              Text('Home Address', style: TextStyle(fontSize: 16)),
              TextFormField(
                onChanged: (value) {
                  _homeAddress = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your home address',
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}