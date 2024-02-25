import 'package:flutter/material.dart';
import 'card/passcard.dart';

class PassCardForm extends StatefulWidget {
  @override
  _PassCardFormState createState() => _PassCardFormState();
}

class _PassCardFormState extends State<PassCardForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _nidController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metro Rail PassCard Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
                onTap: () {
                  _selectDate(context);
                },
              ),
              TextFormField(
                controller: _nidController,
                decoration: InputDecoration(labelText: 'NID Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your NID number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _generatePassCard();
                  }
                },
                child: Text('Generate PassCard'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = picked.toString();
      });
    }
  }

  void _generatePassCard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PassCard(
          _nameController.text,
          _dobController.text,
          _nidController.text,
          _phoneController.text,

        ),
      ),
    );
  }
}
