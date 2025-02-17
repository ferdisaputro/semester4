import 'dart:math';

class Circle {
  double _radius;

  // Constructor dengan validasi agar radius selalu positif
  Circle(double radius) : _radius = radius < 0 ? -radius : radius;

  // Getter untuk mendapatkan radius
  double get radius => _radius;

  // Setter untuk mengatur radius dengan validasi
  set radius(double value) {
    _radius = value < 0 ? -value : value;
  }

  // Getter untuk menghitung luas lingkaran
  double get area => pi * _radius * _radius;
}

void main() {
  var circle = Circle(-5);
  print('Radius: ${circle.radius}');
  print('Luas: ${circle.area}');

  circle.radius = -10;
  print('Radius setelah diubah: ${circle.radius}');
  print('Luas setelah diubah: ${circle.area}');
}
