void main() {
  for (int i = 1; i <= 20; i++) {
    if (i % 3 == 0 && i % 2 != 0) {
      // Jika angka kelipatan 3 dan ganjil
      print('$i - I Love Coding');
    } else if (i % 2 == 0) {
      // Jika angka genap
      print('$i - Berkualitas');
    } else {
      // Jika angka ganjil
      print('$i - Santai');
    }
  }
}
