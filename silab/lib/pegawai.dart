import 'package:flutter/material.dart';
import 'header.dart' as hdr;

class pegawaiPage extends StatelessWidget {
  pegawaiPage({super.key});

  final List<Map<String, String>> pegawaiList = [
    {"name": "John Doe", "role": "Dosen"},
    {"name": "Alice Smith", "role": "Teknisi"},
    {"name": "Michael Johnson", "role": "Administrator"},
    {"name": "Emma Williams", "role": "Dosen"},
    {"name": "Robert Brown", "role": "Teknisi"},
    {"name": "John Doe", "role": "Dosen"},
    {"name": "Alice Smith", "role": "Teknisi"},
    {"name": "Michael Johnson", "role": "Administrator"},
    {"name": "Emma Williams", "role": "Dosen"},
    {"name": "Robert Brown", "role": "Teknisi"},
    {"name": "John Doe", "role": "Dosen"},
    {"name": "Alice Smith", "role": "Teknisi"},
    {"name": "Michael Johnson", "role": "Administrator"},
    {"name": "Emma Williams", "role": "Dosen"},
    {"name": "Robert Brown", "role": "Teknisi"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            hdr.Header(), // Header
            SizedBox(height: 40),

            // Bagian Utama
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        _statCard("Dosen", "40", [Color(0xFF24C662), Color(0xFF3FCDA0)]),
                        SizedBox(height: 15),
                        _statCard("Teknisi", "40", [Color(0xFF2FC7C8), Color(0xFF5FA8F6)]),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        _statCard("Administrator", "40", [Color(0xFFB1CE60), Color(0xFF5ED1B5)]),
                        SizedBox(height: 15),
                        _statCard("Teknisi", "40", [Color(0xFF34C56D), Color(0xFFC2C4E3)]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _statCard("Tidak Aktif", "40", [Color(0xFF53CFC7), Color(0xFFA39EE9)]),
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
                    "Data Pegawai",
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: pegawaiList.map((pegawai) => _pegawaiCard(pegawai["name"]!, pegawai["role"]!)).toList(),
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

  //Widget untuk data pegawai
  Widget _pegawaiCard(String name, String role) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black54,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(role),
        trailing: Icon(Icons.more_horiz),
      ),
    );
  }

  // Widget untuk Kartu Statistik
  Widget _statCard(String title, String value, List<Color> gradientColors) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
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
}
