import 'package:flutter/material.dart';
import 'header.dart'as hdr;
// import 'NavBar.dart'as nav;

class barangPage extends StatelessWidget {
  const barangPage({super.key});

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

            // Statistik Peminjaman (Tetap Full Width)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _SPStatCard(),
            ),

            SizedBox(height: 40),

            // Search Bar dan Refresh Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),


            // Data Pegawai Text dengan Icon Button di sisi kanan
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "List Barang",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh_sharp),
                    onPressed: () {}, // Tambahkan fungsi refresh di sini
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // List Barang
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: _generateBarangList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Fungsi untuk membuat daftar barang
  List<Widget> _generateBarangList() {
    List<Map<String, String>> barang = [
      {"kode": "BRNG-1-12", "nama": "Kertas F4", "jenis": "Bahan", "stok": "10"},
      {"kode": "BRNG-1-13", "nama": "Bolpoin", "jenis": "Alat", "stok": "20"},
      {"kode": "BRNG-1-14", "nama": "Penghapus", "jenis": "Alat", "stok": "15"},
      {"kode": "BRNG-1-15", "nama": "Pensil", "jenis": "Alat", "stok": "25"},
      {"kode": "BRNG-1-12", "nama": "Kertas F4", "jenis": "Bahan", "stok": "10"},
      {"kode": "BRNG-1-13", "nama": "Bolpoin", "jenis": "Alat", "stok": "20"},
      {"kode": "BRNG-1-14", "nama": "Penghapus", "jenis": "Alat", "stok": "15"},
      {"kode": "BRNG-1-15", "nama": "Pensil", "jenis": "Alat", "stok": "25"},
      {"kode": "BRNG-1-12", "nama": "Kertas F4", "jenis": "Bahan", "stok": "10"},
      {"kode": "BRNG-1-13", "nama": "Bolpoin", "jenis": "Alat", "stok": "20"},
      {"kode": "BRNG-1-14", "nama": "Penghapus", "jenis": "Alat", "stok": "15"},
      {"kode": "BRNG-1-15", "nama": "Pensil", "jenis": "Alat", "stok": "25"},
    ];
    return barang.map((item) => _barangList(item)).toList();
  }

  // Widget untuk List Barang
  Widget _barangList(Map<String, String> item) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item["kode"]!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                Row(
                  children: [
                    Text("Stok ", style: TextStyle(fontSize: 14)),
                    Text(item["stok"]!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(item["nama"]!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "Jenis ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(
                          text: item["jenis"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.more_horiz, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget Statistik Barang
  Widget _SPStatCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF87BFFD), Color(0xFF53D0C9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
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
          _SPStat("40", "Dosen"),
          // _divider(),
          _SPStat("40", "Bahan"),
          // _divider(),
          _SPStat("40", "Alat"),
        ],
      ),
    );
  }

  // Widget untuk Statistik Barang (angka & label)
  Widget _SPStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }
}
