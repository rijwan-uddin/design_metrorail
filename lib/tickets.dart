import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Tickets extends StatelessWidget {
  const Tickets({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase ticket'),
      ),
      body: TicketBookPage(),
    );
  }
}

class TicketBookPage extends StatefulWidget {
  @override
  _TicketBookPageState createState() => _TicketBookPageState();
}

class _TicketBookPageState extends State<TicketBookPage> {
  final List<String> stationNames = [
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
  ];

  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  DateTime? _selectedDate;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TypeAheadFormField<String>(
              textFieldConfiguration: InputDecoration(
                labelText: 'Station From',
              ),
              suggestionsCallback: (pattern) {
                return stationNames.where((station) =>
                    station.toLowerCase().contains(pattern.toLowerCase()));
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (String suggestion) {
                _fromController.text = suggestion;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter station from';
                }
                return null;
              },
            ),
            TypeAheadFormField<String>(
              textFieldConfiguration: InputDecoration(
                labelText: 'Station To',
              ),
              suggestionsCallback: (pattern) {
                return stationNames.where((station) =>
                    station.toLowerCase().contains(pattern.toLowerCase()));
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (String suggestion) {
                _toController.text = suggestion;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter station to';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Date of Journey'),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null && pickedDate != _selectedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select date of journey';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Proceed to payment options'),
                    ),
                  );
                }
              },
              child: Text('Proceed'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Payment options will be displayed here'),
                  ),
                );
              },
              child: Text('Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

