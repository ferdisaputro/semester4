import 'dart:async';

void main(List<String> args) {
  print("Life is"); // Langsung tampil


  Future.delayed(Duration(seconds: 5), () {
    print("never flat"); // Tampil setelah 5 detik
  });

}
