void main() {
  // Membuat Persegi Panjang 8x4
  print("Membuat Persegi Panjang #");
  for (int i = 0; i < 4; i++) {
    print("########");
  }

  print("\nMembuat Tangga");
  // Membuat Tangga Tinggi 7 dan Alas 7
  for (int i = 1; i <= 7; i++) {
    String hashes = "#" * i;  // Mengulang tanda pagar sebanyak i kali
    print(hashes);
  }
}
