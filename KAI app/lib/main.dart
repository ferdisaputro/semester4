import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contoh Looping'),
        ),
        body: LoopingExample(),
      ),
    );
  }
}

class LoopingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // While-loop 1: Looping Angka 1-9 Sederhana
          Text('While-loop 1: Looping Angka 1-9 Sederhana'),
          ..._whileLoop1(),

          // While-loop 2: Looping Mengembalikan Angka Total
          Text('While-loop 2: Looping Mengembalikan Angka Total'),
          ..._whileLoop2(),

          // For-loop 1: Looping Angka 1-9 Sederhana
          Text('For-loop 1: Looping Angka 1-9 Sederhana'),
          ..._forLoop1(),

          // For-loop 2: Looping Mengembalikan Angka Total
          Text('For-loop 2: Looping Mengembalikan Angka Total'),
          ..._forLoop2(),

          // For-loop 3: Looping Dengan Increment dan Decrement Lebih dari 1
          Text('For-loop 3: Looping Dengan Increment dan Decrement Lebih dari 1'),
          ..._forLoop3(),
        ],
      ),
    );
  }

  // Method untuk While-loop 1
  List<Widget> _whileLoop1() {
    var flag = 1;
    List<Widget> output = [];
    while (flag < 10) {
      output.add(Text('Iterasi ke-$flag'));
      flag++;
    }
    return output;
  }

  // Method untuk While-loop 2
  List<Widget> _whileLoop2() {
    var deret = 5;
    var jumlah = 0;
    List<Widget> output = [];
    while (deret > 0) {
      jumlah += deret;
      output.add(Text('Jumlah saat ini: $jumlah'));
      deret--;
    }
    output.add(Text('Jumlah terakhir: $jumlah'));
    return output;
  }

  // Method untuk For-loop 1
  List<Widget> _forLoop1() {
    List<Widget> output = [];
    for (var angka = 1; angka < 10; angka++) {
      output.add(Text('Iterasi ke-$angka'));
    }
    return output;
  }

  // Method untuk For-loop 2
  List<Widget> _forLoop2() {
    var jumlah = 0;
    List<Widget> output = [];
    for (var deret = 5; deret > 0; deret--) {
      jumlah += deret;
      output.add(Text('Jumlah saat ini: $jumlah'));
    }
    output.add(Text('Jumlah terakhir: $jumlah'));
    return output;
  }

  // Method untuk For-loop 3
  List<Widget> _forLoop3() {
    List<Widget> output = [];
    for (var deret = 0; deret < 10; deret += 2) {
      output.add(Text('Iterasi dengan Increment counter 2: $deret'));
    }
    output.add(Text('-------------------------------'));
    for (var deret = 15; deret > 0; deret -= 3) {
      output.add(Text('Iterasi dengan Decrement counter: $deret'));
    }
    return output;
  }
}
