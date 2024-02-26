import 'package:flutter/material.dart';

class BkashPaymentPage extends StatefulWidget {
  const BkashPaymentPage({Key? key}) : super(key: key);

  @override
  State<BkashPaymentPage> createState() => _BkashPaymentPageState();
}

class _BkashPaymentPageState extends State<BkashPaymentPage> {
  double _selectedAmount = 0.0;
  bool _isPaymentConfirmed = false;

  void _handlePaymentConfirmation() {
    if (_selectedAmount > 0.0) {
      // Simulate payment processing (replace with actual integration)
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isPaymentConfirmed = true);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid payment amount.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bKash Payment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Payment Amount',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                try {
                  _selectedAmount = double.parse(value);
                } catch (e) {
                  _selectedAmount = 0.0;
                }
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handlePaymentConfirmation,
              child: const Text('Confirm Payment'),
            ),
            if (_isPaymentConfirmed)
              AlertDialog(
                title: const Text('Payment Successful!'),
                content: Text('You have paid \$ ${_selectedAmount.toStringAsFixed(2)} via bKash.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
