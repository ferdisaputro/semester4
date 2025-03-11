import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(HealthCheckApp());
}

class HealthCheckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        hintColor: Colors.orangeAccent,
      ),
      home: HealthCheckScreen(),
    );
  }
}

class HealthCheckScreen extends StatefulWidget {
  @override
  _HealthCheckScreenState createState() => _HealthCheckScreenState();
}

class _HealthCheckScreenState extends State<HealthCheckScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  void navigateToResultPage(BuildContext context) {
    double weight = double.tryParse(weightController.text) ?? -1;
    double height = double.tryParse(heightController.text) ?? -1;

    if (weight < 0 || height < 0) {
      return; // Menjaga agar tidak navigasi jika input tidak valid
    }

    // Hitung BMI
    double bmi = weight / (height / 100 * height / 100);
    int kategori;

    if (bmi < 18.5) {
      kategori = 1; // Kurus
    } else if (bmi < 25) {
      kategori = 2; // Normal
    } else if (bmi < 30) {
      kategori = 3; // Kelebihan berat badan
    } else if (bmi < 35) {
      kategori = 4; // Obesitas kelas 1
    } else if (bmi < 40) {
      kategori = 5; // Obesitas kelas 2
    } else {
      kategori = 6; // Obesitas kelas 3 (Morbid)
    }

    // Navigasi ke halaman hasil
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(bmi: bmi, kategori: kategori),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cek Kesehatan Berdasarkan BMI")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Masukkan berat badan (kg)",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Masukkan tinggi badan (cm)",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => navigateToResultPage(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Cek BMI",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final double bmi;
  final int kategori;

  ResultPage({required this.bmi, required this.kategori});

  @override
  Widget build(BuildContext context) {
    String message = "";

    switch (kategori) {
      case 1:
        message = "BMI Anda: ${bmi.toStringAsFixed(2)} \n Kategori: Kurus.";
        break;
      case 2:
        message = "BMI Anda: ${bmi.toStringAsFixed(2)} \n Kategori: Normal.";
        break;
      case 3:
        message = "BMI Anda: ${bmi.toStringAsFixed(2)} \n Kategori: Kelebihan berat badan.";
        break;
      case 4:
        message = "BMI Anda: ${bmi.toStringAsFixed(2)} \n Kategori: Obesitas kelas 1.";
        break;
      case 5:
        message = "BMI Anda: ${bmi.toStringAsFixed(2)} \n Kategori: Obesitas kelas 2.";
        break;
      case 6:
        message = "BMI Anda: ${bmi.toStringAsFixed(2)} \n Kategori: Obesitas kelas 3 (Morbid).";
        break;
      default:
        message = "Perhitungan BMI Salah.";
        break;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Hasil Perhitungan BMI")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
