import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _registerUser() async {
    String username = usernameController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (username.length < 3 || password.length < 5 || password != confirmPassword) {
      _showDialog('Error: Username min 3 char, password min 6 char, dan harus cocok!');
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList('users') ?? [];
    String hashedPassword = md5.convert(utf8.encode(password)).toString();

    // Cek jika username sudah ada
    for (String user in users) {
      Map<String, dynamic> userData = json.decode(user);
      if (userData['username'] == username) {
        _showDialog('Username sudah terdaftar!');
        return;
      }
    }

    users.add(json.encode({'username': username, 'password': hashedPassword}));
    await prefs.setStringList('users', users);
    _showDialog('Registrasi berhasil! Silakan login.');
    Navigator.pop(context);
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
      appBar: AppBar(title: Text('Register')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue.shade200, Colors.purple.shade200]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: usernameController, decoration: InputDecoration(labelText: 'Username')),
              TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
              TextField(controller: confirmPasswordController, decoration: InputDecoration(labelText: 'Confirm Password'), obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _registerUser, child: Text('Register')),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/login'), child: Text('Sudah punya akun? Login')),
            ],
          ),
        ),
      ),
    );
  }
}