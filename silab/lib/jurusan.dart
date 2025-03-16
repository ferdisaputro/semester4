import 'package:flutter/material.dart';
import 'header.dart'as hdr;
// import 'NavBar.dart'as nav;

class jurusanPage extends StatelessWidget {
  const jurusanPage({super.key});

  final List<Map<String, String>> jurusanList = const [
    {
      "kode": "PL.18.2.0",
      "nama": "Teknologi Informasi",
      "kaprodi": "Kangen Band S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.1",
      "nama": "Sistem Informasi",
      "kaprodi": "Raisa Andriana S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.2",
      "nama": "Teknik Informatika",
      "kaprodi": "Ariel Noah S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.0",
      "nama": "Teknologi Informasi",
      "kaprodi": "Kangen Band S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.1",
      "nama": "Sistem Informasi",
      "kaprodi": "Raisa Andriana S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.2",
      "nama": "Teknik Informatika",
      "kaprodi": "Ariel Noah S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.0",
      "nama": "Teknologi Informasi",
      "kaprodi": "Kangen Band S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.1",
      "nama": "Sistem Informasi",
      "kaprodi": "Raisa Andriana S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.2",
      "nama": "Teknik Informatika",
      "kaprodi": "Ariel Noah S.Kom, M.Kom"
    },
  ];

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
                    "Data Jurusan",
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

            // List Jurusan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jurusanList.length,
                itemBuilder: (context, index) {
                  return _buildJurusanCard(jurusanList[index]);
                },
              ),
            ),

            const SizedBox(height: 20),

            // SizedBox(height: 20),
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


  // Widget Statistik Program Studi
  Widget _SPStatCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFA0A0E8), Color(0xFF53CFC7)],
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
        ],
      ),
    );
  }

  // Widget untuk Statistik Program Studi (angka & label)
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

  Widget _buildJurusanCard(Map<String, String> jurusan) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    jurusan["kode"]!,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Icon(Icons.more_horiz, color: Colors.black),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                jurusan["nama"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Ka. Jurusan", style: TextStyle(color: Colors.black54)),
                  Text(
                    jurusan["kaprodi"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
