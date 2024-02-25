import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class bio extends StatelessWidget {
  const bio({Key? key}) : super(key: key);

  Future<void> _authenticateWithBiometrics() async {
    const platform = MethodChannel('your_channel_name');
    try {
      // Invoke method to start biometric authentication
      final bool success = await platform.invokeMethod('authenticateWithBiometrics');
      if (success) {
        // Biometric authentication successful
        // Save biometric data securely
        print('Biometric authentication successful');
        // Save the biometric data here
      } else {
        // Biometric authentication failed
        print('Biometric authentication failed');
      }
    } on PlatformException catch (e) {
      print('Failed to authenticate with biometrics: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _authenticateWithBiometrics,
              child: Text('Authenticate with Biometrics'),
            ),
          ],
        ),
      ),
    );
  }
}
