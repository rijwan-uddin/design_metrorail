import 'package:flutter/material.dart';
import 'package:design_metrorail/setting/utility/biometric.dart';
class Security extends StatelessWidget {
  const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SecurityFeatureCard(
              title: 'Two-Factor Authentication',
              description:
              'Add an extra layer of security with two-factor authentication.',
              icon: Icons.lock,
              onTap: () {
                // Add functionality for two-factor authentication here
                print('Implement two-factor authentication');
              },
            ),
            const SizedBox(height: 16.0),
            SecurityFeatureCard(
              title: 'Biometric Authentication',
              description:
              'Secure your app with biometric authentication such as fingerprint or face recognition.',
              icon: Icons.fingerprint,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => bio()),
                );

              },
            ),
            // Add more SecurityFeatureCard widgets for additional features
          ],
        ),
      ),
    );
  }
}

class SecurityFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const SecurityFeatureCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.blue,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
