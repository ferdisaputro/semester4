import 'package:flutter/material.dart';
import 'package:silab/models/laboratory.dart';
import 'package:silab/services/laboratory_service.dart';
import 'package:silab/widgets/centered_stat_card.dart';
import 'package:silab/widgets/centered_stat_text.dart';
import 'laboratory_card.dart';

class LaboratoryView extends StatefulWidget {
  const LaboratoryView({super.key});

  @override
  State<LaboratoryView> createState() => _LaboratoryViewState();
}

class _LaboratoryViewState extends State<LaboratoryView> {
  List<Laboratory> _laboratoryList = [];
  List<Laboratory> _filteredLaboratoryList = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getLaboratory();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> getLaboratory() async {
    final labs = await LaboratoryService().fetchLaboratory();
    setState(() {
      _laboratoryList = labs;
      _filteredLaboratoryList = labs;
    });
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredLaboratoryList = _laboratoryList.where((lab) {
        return (lab.laboratoryName ?? '').toLowerCase().contains(query) ||
              (lab.code ?? '').toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Column(
        children: [
          _SPStatCard(),
          const SizedBox(height: 40),
          _buildSearchBar(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Data Laboratorium",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.refresh_sharp),
                onPressed: getLaboratory,
              ),
            ],
          ),
          _filteredLaboratoryList.isEmpty?
                  Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: _filteredLaboratoryList
                        .map((lab) => LaboratoryCard(lab: lab))
                        .toList(),
                  ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Cari nama atau kode laboratorium...",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }

  Widget _SPStatCard() {
    return CenteredStatCard(
      gradientColors: [Color(0xFFC890E3), Color(0xFFE6B467)], 
      children: [
        CenteredStatText(
          _laboratoryList.length.toString(), 
          "Jumlah Laboratorium"
        ),
        CenteredStatText(
          "${_laboratoryList.expand((e) => e.formatedHeadOfLab ?? []).length}",
          "Pengurus Laboratorium",
        ),
      ],
    );
  }

  Widget _SPStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }
}
