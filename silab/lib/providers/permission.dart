import 'package:flutter/material.dart';
import 'package:silab/providers/AppBar.dart';
import 'package:silab/providers/bottom_navigation.dart';

class Permission extends StatelessWidget {
  const Permission({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> roles = ["Pegawai", "Dosen", "Administrator", "Teknisi"];
    List<String> actions = ["Edit", "Tambah", "Hapus"];
    List<String> permissions = [];

    for (var role in roles) {
      for (var action in actions) {
        permissions.add("$role - $action");
      }
    }
    // permissions.add("Super Admin - Semua Akses"); // Tambahan agar jumlahnya ganjil

    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AnimatedAlign(
          alignment: Alignment.center, // nilai default
          duration: Duration(milliseconds: 150),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image(image: AssetImage('assets/silab.png')),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            // Statistik Permission
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
                    "Data Permissions",
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

            // Data Permission
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _buildPermissionGrid(permissions),
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

  // Widget Statistik
  Widget _SPStatCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF61A5FA), Color(0xFF9696F9)],
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

  // Grid Data Permission
  Widget _buildPermissionGrid(List<String> permissions) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: permissions.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return _buildPermissionCard(permissions[index]);
              },
            ),
          ],
        );
      },
    );
  }

  // Widget Card Data Permission
  Widget _buildPermissionCard(String title) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("..."),
          ],
        ),
      ),
    );
  }
}
