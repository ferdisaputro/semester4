import 'package:flutter/material.dart';
import 'package:mockup_ki/primary_colors.dart';

class MultiTripCard extends StatelessWidget {
  const MultiTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange[300]!, Color(0xFFFF5C87), Colors.deepOrange[300]!, Color(0xFFFF5C87), Colors.deepOrange[300]!],
            begin: Alignment.topCenter,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _appBar(),
              SizedBox(height: 15,),
              _cardInformation(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      buildTile(Icons.credit_card, 'Isi Ulang', 'Isi ulang kartu KMT Anda sekarang'),
                      SizedBox(height: 10,),
                      buildTile(Icons.account_balance_wallet, 'Cek & Update Saldo', 'Cek atau update saldo kartu KMT Anda'),
                      SizedBox(height: 10,),
                      buildTile(Icons.history, 'Riwayat', 'Riwayat isi ulang dan perjalanan KMT'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          Center(
            child: Text(
              "Isi Ulang KMT",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20
              ),
            ),
          )
        ]
      ),
    );
  }

  Widget _cardInformation() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kartu Multi Trip',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Tempel dan tahan kartu dibelakang ponsel untuk cek dan perbarui saldo, lihat riwayat dan isi ulang.',
                style: TextStyle(color: Colors.black87),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTile(IconData icon, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1)
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: Icon(icon, color: PrimaryColors.lightPurple, size: 19),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.grey.shade800),
        onTap: () {}, // Implement navigation here
      ),
    );
  }
}
