import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _peranController = TextEditingController();

  String resultMessage = '';

  void _checkGameConditions() {
    String nama = _namaController.text.trim();
    String peran = _peranController.text.trim();

    if (nama.isEmpty && peran.isEmpty) {
      setState(() {
        resultMessage = 'Nama harus diisi!';
      });
    } else if (nama.isNotEmpty && peran.isEmpty) {
      setState(() {
        resultMessage = 'Halo $nama, Pilih peranmu untuk memulai game!';
      });
    } else if (nama.isNotEmpty && peran == 'Penyihir') {
      setState(() {
        resultMessage = 'Selamat datang di Dunia Werewolf, $nama\nHalo Penyihir $nama, kamu dapat melihat siapa yang menjadi werewolf!';
      });
    } else if (nama.isNotEmpty && peran == 'Guard') {
      setState(() {
        resultMessage = 'Selamat datang di Dunia Werewolf, $nama\nHalo Guard $nama, kamu akan membantu melindungi temanmu dari serangan werewolf.';
      });
    } else if (nama.isNotEmpty && peran == 'Werewolf') {
      setState(() {
        resultMessage = 'Selamat datang di Dunia Werewolf, $nama\nHalo Werewolf $nama, Kamu akan memakan mangsa setiap malam!';
      });
    } else {
      setState(() {
        resultMessage = 'Peran tidak dikenali!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Werewolf'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Masukkan Nama'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _peranController,
              decoration: InputDecoration(labelText: 'Masukkan Peran (Penyihir/Guard/Werewolf)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkGameConditions,
              child: Text('Mulai Game'),
            ),
            SizedBox(height: 20),
            Text(
              resultMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
