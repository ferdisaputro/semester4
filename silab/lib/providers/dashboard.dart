import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/providers/auth_provider.dart';
import 'package:silab/widgets/stat_card.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              staggeredTiles: const [
                StaggeredTile.fit(2),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
              ],
              children: [
                Row(
                  children: [
                    Expanded(child: _profileSection(context)),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        children: const [
                          StatCard("Stok Barang Menipis", "40", [Color(0xFF54CEC7), Color(0xFFA39EE9)]),
                          SizedBox(height: 15),
                          StatCard("Teknisi", "40", [Color(0xFF989BEA), Color(0xFF52B6D4)]),
                        ],
                      ),
                    ),
                  ],
                ),
                const StatCard("Staff Aktif", "40", [Color(0xFF91CEE1), Color(0xFF59CA9F)]),
                const StatCard("Aktif", "40", [Color(0xFF52D1C5), Color(0xFFC4BFBA)]),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: _LoanStatCard(),
          ),
        ],
      ),
    );
  }

  // Bagian Profil
  Widget _profileSection(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/logo.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Halo ${context.watch<AuthProvider>().user.name}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        Text(
          context.watch<AuthProvider>().user.email,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

// Statistik Peminjaman - dipisahkan untuk menjaga kode lebih bersih
class _LoanStatCard extends StatelessWidget {
  const _LoanStatCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF89BEFF), Color(0xFF4FD1C5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _LoanStat("30", "Peminjaman"),
          _LoanStat("2", "Sedang Dipinjam"),
          _LoanStat("12", "Kembali"),
        ],
      ),
    );
  }
}

class _LoanStat extends StatelessWidget {
  final String number;
  final String label;

  const _LoanStat(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
