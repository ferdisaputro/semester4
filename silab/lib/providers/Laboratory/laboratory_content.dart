import 'package:flutter/material.dart';
import 'package:silab/models/laboratory.dart';
import 'package:silab/services/laboratory_service.dart';
import 'laboratory_card.dart';

class LaboratoryContent extends StatefulWidget {
  const LaboratoryContent({super.key});

  @override
  State<LaboratoryContent> createState() => _LaboratoryContentState();
}

class _LaboratoryContentState extends State<LaboratoryContent> {
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _SPStatCard(),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSearchBar(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
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
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _filteredLaboratoryList.isEmpty
                ? const Center(
                    child: Text(
                      "Tidak ada laboratorium ditemukan.",
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                : Column(
                    children: _filteredLaboratoryList
                        .map((lab) => LaboratoryCard(lab: lab))
                        .toList(),
                  ),
          ),
          const SizedBox(height: 20),
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFC890E3), Color(0xFFE6B467)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
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
          _SPStat(_laboratoryList.length.toString(), "Jumlah Laboratorium"),
          _SPStat(
            "${_laboratoryList.expand((e) => e.formatedHeadOfLab ?? []).length}",
            "Pengurus Laboratorium",
          ),
        ],
      ),
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
