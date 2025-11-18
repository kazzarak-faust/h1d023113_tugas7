import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';  // Import untuk isDarkMode

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu Kreatif', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: isDarkMode.value,
            onChanged: (value) async {
              isDarkMode.value = value;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isDarkMode', value);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              bool confirm = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Konfirmasi'),
                  content: Text('Yakin logout?'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context, false), child: Text('Batal')),
                    TextButton(onPressed: () => Navigator.pop(context, true), child: Text('Ya')),
                  ],
                ),
              );
              if (confirm) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('currentUser');
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),
    );
  }
}