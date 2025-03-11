void main() {
  print('=== While Loop ===');
  whileLoopExample();

  print('\n=== While Loop dengan Penjumlahan ===');
  whileLoopSumExample();

  print('\n=== For Loop ===');
  forLoopExample();

  print('\n=== For Loop dengan Penjumlahan ===');
  forLoopSumExample();

  print('\n=== For Loop dengan Increment dan Decrement ===');
  forLoopIncrementDecrementExample();
}

void whileLoopExample() {
  var flag = 1;
  while (flag < 10) {
    print('Iterasi ke-' + flag.toString());
    flag++;
  }
}

void whileLoopSumExample() {
  var deret = 5;
  var jumlah = 0;
  while (deret > 0) {
    jumlah += deret;
    deret--;
    print('Jumlah saat ini: ' + jumlah.toString());
  }
  print('Jumlah akhir: ' + jumlah.toString());
}

void forLoopExample() {
  for (var angka = 1; angka < 10; angka++) {
    print('Iterasi ke-' + angka.toString());
  }
}

void forLoopSumExample() {
  var jumlah = 0;
  for (var deret = 5; deret > 0; deret--) {
    jumlah += deret;
    print('Jumlah saat ini: ' + jumlah.toString());
  }
  print('Jumlah terakhir: ' + jumlah.toString());
}

void forLoopIncrementDecrementExample() {
  for (var deret = 0; deret < 10; deret += 2) {
    print('Iterasi dengan Increment counter 2: ' + deret.toString());
  }
  print('-------------------------------');
  for (var deret = 15; deret > 0; deret -= 3) {
    print('Iterasi dengan Decrement counter: ' + deret.toString());
  }
}