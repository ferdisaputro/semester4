import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InstallAppScreen(),
    );
  }
}

class InstallAppScreen extends StatefulWidget {
  @override
  _InstallAppScreenState createState() => _InstallAppScreenState();
}

class _InstallAppScreenState extends State<InstallAppScreen> {
  String message = '';
  TextEditingController _controller = TextEditingController();

  void _processInput() {
    String input = _controller.text.trim().toUpperCase();
    if (input == 'Y') {
      setState(() {
        message = 'Anda akan menginstal aplikasi Dart.';
      });
    } else if (input == 'T') {
      setState(() {
        message = 'Aborted.';
      });
    } else {
      setState(() {
        message = 'Input tidak valid. Masukkan "Y" atau "T".';
      });
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Install App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Apakah Anda ingin menginstal aplikasi Dart? (Y/T)',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan pilihan Anda',
              ),
              onSubmitted: (_) => _processInput(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _processInput,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
