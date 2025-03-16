import 'package:flutter/material.dart';
import 'header.dart'as hdr;
// import 'NavBar.dart'as nav;

class labPage extends StatelessWidget {
   labPage({super.key});

  // Data contoh untuk laboratorium
  final List<Map<String, String>> dataLab = [
    {
      "kode": "PL.18.2.0",
      "nama": "Rekayasa Perangkat Lunak",
      "kepala": "Kangen Band S.Kom, M.Kom"
    },
    {
      "kode": "PL.18.2.1",
      "nama": "Sistem Informasi",
      "kepala": "Dewa 19 S.T, M.T"
    },
    {
      "kode": "PL.18.2.2",
      "nama": "Jaringan Komputer",
      "kepala": "Sheila On 7 S.Kom, M.Kom"
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
                    "Data Laboratorium",
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

            // List Laboratorium
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: dataLab.map((lab) => _LabCard(lab)).toList(),
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
          colors: [Color(0xFFC890E3), Color(0xFFE6B467)],
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
          _SPStat("40", "Jumlah Laboratorium"),
          _SPStat("40", "Pengurus Laboratorium"),
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

   // Widget untuk Kartu Laboratorium
   Widget _LabCard(Map<String, String> lab) {
     return Container(
       margin: EdgeInsets.only(bottom: 16),
       padding: EdgeInsets.all(16),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(12),
         boxShadow: [
           BoxShadow(
             color: Colors.black12,
             blurRadius: 5,
             offset: Offset(2, 2),
           ),
         ],
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           // Baris atas (Kode & Icon titik tiga)
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 lab["kode"]!,
                 style: TextStyle(color: Colors.grey, fontSize: 14),
               ),
               Icon(Icons.more_horiz, color: Colors.black),
             ],
           ),
           SizedBox(height: 4),
           Text(
             lab["nama"]!,
             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
           ),
           Divider(color: Colors.black26),
           SizedBox(height: 4),

           // Informasi Kepala Laboratorium
           Row(
             children: [
               Expanded(
                 child: Text(
                   "Ka. Laboratorium",
                   style: TextStyle(color: Colors.black54),
                 ),
               ),
               Text(":", style: TextStyle(color: Colors.black54)),
               Expanded(
                 child: Align(
                   alignment: Alignment.centerRight,
                   child: Text(
                     lab["kepala"]!,
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                 ),
               ),
             ],
           ),
         ],
       ),
     );
   }
}
