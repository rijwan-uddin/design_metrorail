import 'package:design_metrorail/setting/resetpass.dart';
import 'package:design_metrorail/setting/theme.dart';
import 'package:flutter/material.dart';
import 'package:design_metrorail/main.dart';
import 'package:design_metrorail/setting/yourprofile.dart';
import 'package:design_metrorail/setting/notification.dart';
import 'package:design_metrorail/setting/security.dart';
import 'package:design_metrorail/setting/privacy.dart';


class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(initialName: '', initialPhoneNumber: '', initialEmail: '', initialHomeAddress: '', initialImageUrl: '',)),
              );
              // Action for navigating to profile settings
            },
            child: ListTile(
              title: Text('Your Profile'),
              leading: Icon(Icons.person),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notification()),
              );
              // Action for navigating to notification settings
            },
            child: ListTile(
              title: Text('Notification'),
              leading: Icon(Icons.notifications),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => privacy()),
              );
              // Action for navigating to privacy settings
            },
            child: ListTile(
              title: Text('Privacy'),
              leading: Icon(Icons.privacy_tip),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => security()),
              );
              // Action for navigating to security settings
            },
            child: ListTile(
              title: Text('Security'),
              leading: Icon(Icons.security),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => theme()),
              );
              // Action for navigating to theme settings
            },
            child: ListTile(
              title: Text('Theme'),
              leading: Icon(Icons.color_lens),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => resetpass()),
              );
              // Action for resetting password
            },
            child: ListTile(
              title: Text('Reset Password'),
              leading: Icon(Icons.lock),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to settings page or perform settings-related functionality
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settings()),
              );
                // Add your settings button functionality here
              },
            ),
          ],
        ),
      ),
    );

  }
}


