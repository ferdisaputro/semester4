import 'package:flutter/material.dart';
import 'package:mockup_ki/primary_colors.dart';

class LogisticExpress extends StatelessWidget {
  const LogisticExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[300]!, PrimaryColors.blue.withAlpha(240), Colors.teal[300]!],
            begin: Alignment.topCenter,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              SizedBox(height: 20),

              Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7FAF9),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textField(),
                          SizedBox(height: 24),
                          
                          Text('Cari Informasi',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildInfoCard(Icons.calculate, 'Cek Tarif', 'Informasi tarif pengiriman'),
                              SizedBox(width: 12),
                              buildInfoCard(Icons.local_shipping, 'Informasi Outlet', 'Informasi Outlet KAI Logistik Express'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(IconData icon, String title, String subtitle) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: PrimaryColors.blue),
            SizedBox(height: 16),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(subtitle, style: TextStyle(color: Colors.black54, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.white),
            ],
          ),
        ),
        SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'KAI Logistik Express',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            'Kami melayani kebutuhan pengiriman barang Anda.',
            style: TextStyle(color: Colors.white.withOpacity(0.9)),
          ),
        ),
      ],
    );
  }

  Widget _textField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200)
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cari nomor Resi untuk melacak pengiriman", style: TextStyle(color: Colors.black54, fontSize: 12)),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              children: [
                Icon(Icons.qr_code_scanner, color: PrimaryColors.blue),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukan Nomor Resi',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cek'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PrimaryColors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
