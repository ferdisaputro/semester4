import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/models/dashboard_data.dart';
import 'package:silab/providers/auth_provider.dart';
import 'package:silab/providers/equipment_loan/equipment_loan_card.dart';
import 'package:silab/services/dashboard_service.dart';
import 'package:silab/widgets/centered_stat_card.dart';
import 'package:silab/widgets/centered_stat_text.dart';
import 'package:silab/widgets/stat_card.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardData? _dashboardData;

  @override
  void initState() {
    super.initState();

    _getDashboardData();
  }

  void _getDashboardData() async {
    DashboardData dashboardData = await DashboardDataService().fetchDashboardData();
    setState(() {
      _dashboardData = dashboardData;
    });
  }

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
                        children: [
                          StatCard(
                            "Peminjaman", 
                            _dashboardData?.equipmentLoans?.length.toString() ?? "0", 
                            [Color(0xFF54CEC7), Color(0xFFA39EE9)]
                          ),
                          SizedBox(height: 15),
                          StatCard(
                            "Teknisi", 
                            "40", 
                            [Color(0xFF989BEA), Color(0xFF52B6D4)]
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                StatCard(
                  "Staff Aktif",
                  _dashboardData?.totalStaffActive?.toString() ?? "0",
                  [Color(0xFF91CEE1), Color(0xFF59CA9F)],
                ),
                StatCard(
                  "Staff Non Aktif", 
                  _dashboardData?.totalStaffNonactive?.toString() ?? '0', 
                  [Color(0xFF52D1C5), Color(0xFFC4BFBA)]
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _loanStatCard(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _dashboardData?.equipmentLoans != null && _dashboardData!.equipmentLoans!.isNotEmpty
                ? _dashboardData!.equipmentLoans!.where((loan) => loan.status == 1).isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _dashboardData!.equipmentLoans!.where((loan) => loan.status == 1).length,
                        itemBuilder: (context, index) {
                          return _dashboardData!.equipmentLoans!
                              .where((loan) => loan.status == 1)
                              .map((equipmentLoan) => EquipmentLoanCard(equipmentLoan))
                              .toList()[index];
                        },
                      )
                : const Center(
                    child: Text('Tidak ada peminjaman'),
                  ),
          )
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

  Widget _loanStatCard() {
    return Container(
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
      child: CenteredStatCard(
        gradientColors: [Colors.transparent, Colors.transparent],
        withShadow: false,
        children: [
          if (_dashboardData == null || _dashboardData!.equipmentLoans == null)
            ...[
              CenteredStatText("0", "Peminjaman Hari Ini"),
              CenteredStatText("0", 'Sedang Dipinjam'),
              CenteredStatText("0", 'Kembali'),
            ]
          else
            ...[
              CenteredStatText(
                _dashboardData!.equipmentLoans!
                  .where((loan) => loan.createdAt?.toLocal().toString().split(' ')[0] == DateTime.now().toLocal().toString().split(' ')[0])
                  .length
                  .toString(),
                "Peminjaman (Hari Ini)",
              ),
              CenteredStatText(
                _dashboardData!.equipmentLoans!.length.toString(),
                'Sedang Dipinjam',
              ),
              CenteredStatText(
                _dashboardData!.equipmentLoans!
                  .where((loan) => loan.status == 2 && loan.createdAt?.toLocal().toString().split(' ')[0] == DateTime.now().toLocal().toString().split(' ')[0])
                  .length
                  .toString(),
                'Kembali (Hari Ini)',
              ),
            ],
        ],
      ),
    );
  }
}