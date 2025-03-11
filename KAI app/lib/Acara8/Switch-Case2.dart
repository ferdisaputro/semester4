void main() {
  // Assign nilai variabel
  var hari = 21;
  var bulan = 1;
  var tahun = 1945;

  // Format tanggal
  String tanggal = formatTanggal(hari, bulan, tahun);

  // Tampilkan hasil
  print(tanggal);
}

String formatTanggal(int hari, int bulan, int tahun) {
  // Variabel bulan dalam format nama bulan
  String namaBulan;

  // Switch case untuk menentukan nama bulan
  switch (bulan) {
    case 1:
      namaBulan = 'Januari';
      break;
    case 2:
      namaBulan = 'Februari';
      break;
    case 3:
      namaBulan = 'Maret';
      break;
    case 4:
      namaBulan = 'April';
      break;
    case 5:
      namaBulan = 'Mei';
      break;
    case 6:
      namaBulan = 'Juni';
      break;
    case 7:
      namaBulan = 'Juli';
      break;
    case 8:
      namaBulan = 'Agustus';
      break;
    case 9:
      namaBulan = 'September';
      break;
    case 10:
      namaBulan = 'Oktober';
      break;
    case 11:
      namaBulan = 'November';
      break;
    case 12:
      namaBulan = 'Desember';
      break;
    default:
      namaBulan = 'Bulan tidak valid';
  }

  // Format tanggal dengan nama bulan
  return '$hari $namaBulan $tahun';
}
