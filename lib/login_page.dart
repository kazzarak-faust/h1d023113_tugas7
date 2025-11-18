import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    String hashedPassword = md5.convert(utf8.encode(password)).toString();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList('users') ?? [];

    bool isValid = false;
    for (String user in users) {
      Map<String, dynamic> userData = json.decode(user);
      if (userData['username'] == username && userData['password'] == hashedPassword) {
        isValid = true;
        await prefs.setString('currentUser', username);
        break;
      }
    }

    if (isValid) {
      _showDialog('Login berhasil!');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    } else {
      _showDialog('Username atau password salah!');
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Info'),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.green.shade200, Colors.blue.shade200]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(tag: 'logo', child: Icon(Icons.lock, size: 100, color: Colors.white)),
              TextField(controller: usernameController, decoration: InputDecoration(labelText: 'Username')),
              TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: Text('Login')),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text('Belum punya akun? Register')),
            ],
          ),
        ),
      ),
    );
  }
}