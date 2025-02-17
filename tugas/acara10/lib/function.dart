void main() {
  // Function tanpa return
  greetUser();

  // Function dengan return
  print(findLargest(10, 20));

  // Function dengan parameter
  print(perkalian(5, 4));

  // Pengiriman parameter lebih dari satu
  print(addNumbers(10, 20, 30));

  // Inisialisasi parameter dengan nilai default
  print(calculateDiscount(1000, discount: 0.15));

  // Anonymous function
  var square = (int x) => x * x;
  print(square(4));  // Output: 16
}

// Function tanpa return
void greetUser() {
  print("Selamat datang di kursus pemrograman Dart!");
}

// Function dengan return
int findLargest(int a, int b) {
  return (a > b) ? a : b;
}

// Function dengan parameter
int perkalian(int num1, int num2) {
  return num1 * num2;
}

// Pengiriman parameter lebih dari satu
int addNumbers(int a, int b, int c) {
  return a + b + c;
}

// Inisialisasi parameter dengan nilai default
double calculateDiscount(double price, {double discount = 0.10}) {
  return price - (price * discount);
}
