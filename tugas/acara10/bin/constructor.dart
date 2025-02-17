// File: employee.dart
class Mhs {
  int nim;
  String name;
  String usia;

  Mhs(this.nim, this.name, this.usia);

  void displayInfo() {
    print("ID: $nim");
    print("Name: $name");
    print("usia: $usia");
  }
}

// File: main.dart
void main() {
  Mhs emp1 = Mhs(1, "Ferdi", "20");
  Mhs emp2 = Mhs(2, "Budi", "20");
  Mhs emp3 = Mhs(3, "Citra", "20");

  emp1.displayInfo();
  print("-------------------");
  emp2.displayInfo();
  print("-------------------");
  emp3.displayInfo();
}
