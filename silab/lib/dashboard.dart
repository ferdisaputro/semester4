import 'package:flutter/material.dart';
import 'header.dart'as hdr;
// import 'NavBar.dart'as nav;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            hdr.Header(), // Tambahkan Header
            // Expanded(child: nav.Navbar()),
            SizedBox(height: 40),

            // Bagian Utama (Dua Kontainer: Kiri & Kanan)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // KONTENER KIRI (Profil & Staff Aktif)
                  Expanded(
                    flex: 1, // Lebih kecil dari kanan
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        _profileSection(), // Profil Pengguna
                        SizedBox(height: 53),
                        _statCard("Staff Aktif", "40", [Color(0xFF91CEE1), Color(0xFF59CA9F)]), // Staff Aktif
                      ],
                    ),
                  ),

                  SizedBox(width: 16), // Jarak antar kontainer

                  // KONTENER KANAN (Teknisi, Stok Barang Menipis, Aktif)
                  Expanded(
                    flex: 1, // Lebih lebar dari kiri
                    child: Column(
                      children: [
                        _statCard("Teknisi", "40", [Color(0xFF989BEA), Color(0xFF52B6D4)]),
                        SizedBox(height: 12),
                        _statCard("Stok Barang Menipis", "40", [Color(0xFF54CEC7), Color(0xFFA39EE9)]),
                        SizedBox(height: 12),
                        _statCard("Aktif", "40", [Color(0xFF52D1C5), Color(0xFFC4BFBA)]),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Statistik Peminjaman (Tetap Full Width)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: _loanStatCard(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Profil Pengguna
  Widget _profileSection() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), // Membuat gambar lingkaran
            border: Border.all(color: Colors.grey.shade300, width: 2), // Opsional: Tambahkan border
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/logo.png",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Halo Pengguna",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        Text(
          "user@gmail.com",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey[600]),
        ),
      ],
    );
  }


  // Widget untuk Kartu Statistik (Staff Aktif, Teknisi, dll.)
  Widget _statCard(String title, String value, List<Color> gradientColors) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // Widget Statistik Peminjaman
  Widget _loanStatCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF89BEFF), // Biru muda
            Color(0xFF4FD1C5), // Turquoise
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _loanStat("30", "Peminjaman"),
          // _divider(),
          _loanStat("2", "Sedang Dipinjam"),
          // _divider(),
          _loanStat("12", "Kembali"),
        ],
      ),
    );
  }

  // Widget untuk Statistik Peminjaman (angka & label)
  Widget _loanStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  // Widget garis pemisah antar elemen di Statistik Peminjaman
  // Widget _divider() {
  //   return Container(
  //     height: 30,
  //     width: 2,
  //     color: Colors.white.withOpacity(0.5),
  //     margin: EdgeInsets.symmetric(horizontal: 8),
  //   );
  // }
}
