import 'package:flutter/material.dart';
import 'bkash.dart';
import 'rocket.dart';
import 'nagad.dart';


class PaymentPage extends StatefulWidget {
  final double amount;

  const PaymentPage({Key? key, required this.amount}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedPaymentOption = 0; // 0: bKash, 1: Rocket, 2: Nagad

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600), // Ensure maximum width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amount to pay: \$ ${widget.amount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Select Payment Method:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Wrap( // Use Wrap for flexible layout on smaller screens
                runSpacing: 10.0,
                children: [
                  _buildPaymentMethodOption(
                    image: Image.asset('assets/images/bkash.png'),
                    text: 'bKash',
                    isSelected: _selectedPaymentOption == 0,
                    onTap: () => setState(() => _selectedPaymentOption = 0),
                  ),
                  _buildPaymentMethodOption(
                    image: Image.asset('assets/images/rocket.png'),
                    text: 'Rocket',
                    isSelected: _selectedPaymentOption == 1,
                    onTap: () => setState(() => _selectedPaymentOption = 1),
                  ),
                  _buildPaymentMethodOption(
                    image: Image.asset('assets/images/nagad.png'),
                    text: 'Nagad',
                    isSelected: _selectedPaymentOption == 2,
                    onTap: () => setState(() => _selectedPaymentOption = 2),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Implement payment logic based on selected option
                  // ...
                },
                child: const Text('Pay Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodOption({
    required Image image,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[100] : Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
          width: 1.0,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                image,
                const SizedBox(width: 10.0),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: isSelected ? Colors.blue : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
