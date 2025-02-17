// File: titan.dart
class Konoha {
  double _powerPoint;

  Konoha(this._powerPoint);

  double get powerPoint => _powerPoint < 5 ? 5 : _powerPoint;
  set powerPoint(double value) => _powerPoint = value;
}

// File: armor_titan.dart
class Naruto extends Konoha {
  Naruto(double powerPoint) : super(powerPoint);
  String Rasengan() => "Rasen Suriken....";
}

// File: attack_titan.dart
class Sasuke extends Konoha {
  Sasuke(double powerPoint) : super(powerPoint);
  String Chidori() => "Chidori.........";
}

// File: beast_titan.dart
class Sakura extends Konoha {
  Sakura(double powerPoint) : super(powerPoint);
  String samaro() => "Bumm...........";
}

// File: main.dart
void main() {
  Naruto kurama = Naruto(8);
  Sasuke susanoo = Sasuke(7);
  Sakura hueeee = Sakura(3);

  print("Naruto Power: ${kurama.powerPoint}");
  print("Naruto Action: ${kurama.Rasengan()}");

  print("Attack Sasuke Power: ${susanoo.powerPoint}");
  print("Attack Sasuke Action: ${susanoo.Chidori()}");

  print("Beast Sakura Power: ${hueeee.powerPoint}");
  print("Beast Sakura Action: ${hueeee.samaro()}");

}
