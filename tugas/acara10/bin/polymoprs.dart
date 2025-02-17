// File: bangun_datar.dart
abstract class BangunDatar {
  double luas();
  double keliling();
}

// File: jajargenjang.dart
class Jajargenjang extends BangunDatar {
  double alas, tinggi, sisiMiring;

  Jajargenjang(this.alas, this.tinggi, this.sisiMiring);

  @override
  double luas() => alas * tinggi;

  @override
  double keliling() => 2 * (alas + sisiMiring);
}

// File: layang_layang.dart
class LayangLayang extends BangunDatar {
  double diagonal1, diagonal2, sisiA, sisiB;

  LayangLayang(this.diagonal1, this.diagonal2, this.sisiA, this.sisiB);

  @override
  double luas() => 0.5 * diagonal1 * diagonal2;

  @override
  double keliling() => 2 * (sisiA + sisiB);
}

// File: main.dart
void main() {
  Jajargenjang jajargenjang = Jajargenjang(8, 5, 7);
  LayangLayang layangLayang = LayangLayang(6, 8, 5, 5);

  print("Luas Jajargenjang: ${jajargenjang.luas()}");
  print("Keliling Jajargenjang: ${jajargenjang.keliling()}");

  print("Luas Layang-Layang: ${layangLayang.luas()}");
  print("Keliling Layang-Layang: ${layangLayang.keliling()}");
}
