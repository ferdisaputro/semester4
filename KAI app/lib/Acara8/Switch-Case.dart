import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuotesScreen(),
    );
  }
}

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  String selectedDay = 'Senin';
  String quote = '';

  void getQuote(String day) {
    setState(() {
      switch (day) {
        case 'Senin':
          quote = 'Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.';
          break;
        case 'Selasa':
          quote = 'Setiap detik sangatlah berharga karena waktu mengetahui banyak hal, termasuk rahasia hati.';
          break;
        case 'Rabu':
          quote = 'Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.';
          break;
        case 'Kamis':
          quote = 'Jika hatimu banyak merasakan sakit, maka belajarlah dari rasa sakit itu untuk tidak memberikan rasa sakit pada orang lain.';
          break;
        case 'Jumat':
          quote = 'Hidup tak selamanya tentang pacar.';
          break;
        case 'Sabtu':
          quote = 'Rumah bukan hanya sebuah tempat, tetapi itu adalah perasaan.';
          break;
        case 'Minggu':
          quote = 'Hanya seseorang yang takut yang bisa bertindak berani. Tanpa rasa takut itu tidak ada apapun yang bisa disebut berani.';
          break;
        default:
          quote = 'Pilih hari untuk melihat quotes.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quotes Harian')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pilih Hari:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedDay,
              items: ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu']
                  .map((String day) {
                return DropdownMenuItem<String>(
                  value: day,
                  child: Text(day),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedDay = newValue;
                  });
                  getQuote(newValue);
                }
              },
            ),
            SizedBox(height: 20),
            Text(quote, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
