
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageEdit extends StatefulWidget {
  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _homeAddress = '';
  String _imageUrl = '';

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageUrl = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _getImageFromGallery,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageUrl.isNotEmpty
                        ? FileImage(File(_imageUrl))
                        : AssetImage('assets/default_avatar.png') as ImageProvider<Object>,
                    child: _imageUrl.isEmpty ? Icon(Icons.person, size: 50) : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _homeAddress = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your home address',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save the details and navigate back
          Navigator.pop(context, {
            'name': _name,
            'phoneNumber': _phoneNumber,
            'email': _email,
            'homeAddress': _homeAddress,
            'imageUrl': _imageUrl,
          });
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
