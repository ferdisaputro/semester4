import 'package:flutter/material.dart';

class programstudiPage extends StatelessWidget {
  const programstudiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    "Data Program Studi",
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

            // List Program Studi
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: _programStudiList(),
              ),
            ),

            SizedBox(height: 20),
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
          colors: [Color(0xFF34CA86), Color(0xFF4ED1C2)],
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
          _SPStat("40", "Total Program Studi"),
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
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  // List Data Program Studi
  List<Widget> _programStudiList() {
    List<Map<String, String>> dataProdi = [
      {
        "kode": "PR.18.1.2",
        "nama": "Teknik Informatika",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Kangen Band S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.2.3",
        "nama": "Sistem Informasi",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Denny Caknan S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.3.4",
        "nama": "Manajemen Informatika",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Via Vallen S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.4.5",
        "nama": "Teknik Komputer",
        "jurusan": "Jurusan Teknik Elektro",
        "ketua": "Ariel Noah S.T, M.T"
      },
      {
        "kode": "PR.18.1.2",
        "nama": "Teknik Informatika",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Kangen Band S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.2.3",
        "nama": "Sistem Informasi",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Denny Caknan S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.3.4",
        "nama": "Manajemen Informatika",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Via Vallen S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.4.5",
        "nama": "Teknik Komputer",
        "jurusan": "Jurusan Teknik Elektro",
        "ketua": "Ariel Noah S.T, M.T"
      },
      {
        "kode": "PR.18.1.2",
        "nama": "Teknik Informatika",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Kangen Band S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.2.3",
        "nama": "Sistem Informasi",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Denny Caknan S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.3.4",
        "nama": "Manajemen Informatika",
        "jurusan": "Jurusan Teknologi Informasi",
        "ketua": "Via Vallen S.Kom, M.Kom"
      },
      {
        "kode": "PR.18.4.5",
        "nama": "Teknik Komputer",
        "jurusan": "Jurusan Teknik Elektro",
        "ketua": "Ariel Noah S.T, M.T"
      },
    ];

    return dataProdi.map((prodi) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
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
              Row(
                children: [
                  Text(
                    prodi["kode"]!,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Spacer(), // Mendorong ikon ke kanan
                  Icon(Icons.more_horiz, color: Colors.black),
                ],
              ),

              SizedBox(height: 4),
              Text(
                prodi["nama"]!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Jurusan", style: TextStyle(color: Colors.black54)),
                      ),
                      Text(":", style: TextStyle(color: Colors.black54)),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            prodi["jurusan"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Ketua Prodi", style: TextStyle(color: Colors.black54)),
                      ),
                      Text(":", style: TextStyle(color: Colors.black54)),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            prodi["ketua"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
