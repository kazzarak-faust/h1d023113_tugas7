import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'side_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('currentUser') ?? 'Guest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, $username')),
      drawer: SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Card(
              elevation: 8,
              child: ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Cuaca Hari Ini'),
                subtitle: Text('Cerah, 28°C (Simulasi)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}