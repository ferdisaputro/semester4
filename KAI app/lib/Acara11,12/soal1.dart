import 'dart:async';

void main() async {
  // Langsung tampil saat program dijalankan
  print("Luffy, Zoro, Killer, dan nama karakter One Piece lainnya");

  // Menunggu 3 detik sebelum menampilkan output berikutnya
  await Future.delayed(Duration(seconds: 3));

  // Output setelah 3 detik
  print("get data [done], name 3: hilmy");
}
