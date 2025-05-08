import 'package:flutter/material.dart';
import 'package:silab/models/study_program.dart';
import 'package:silab/services/study_program_service.dart';
import 'study_program_card.dart';

class StudyProgramContent extends StatefulWidget {
  const StudyProgramContent({super.key});

  @override
  State<StudyProgramContent> createState() => _StudyProgramContentState();
}

class _StudyProgramContentState extends State<StudyProgramContent> {
  List<StudyProgram> _studyProgramList = [];

  @override
  void initState() {
    super.initState();
    getStudyProgram();
  }

  Future<void> getStudyProgram() async {
    debugPrint("Fetching Study Program...");
    final studyPrograms = await StudyProgramService().fetchStudyProgram();
    setState(() {
      _studyProgramList = studyPrograms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatCard(),
          const SizedBox(height: 30),
          _buildSearchField(),
          const SizedBox(height: 24),
          _buildHeader(),
          const SizedBox(height: 20),
          ..._buildProgramStudiList(),
        ],
      ),
    );
  }

  Widget _buildStatCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF34CA86), Color(0xFF4ED1C2)],
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStat(_studyProgramList.length.toString(), "Total Program Studi"),
        ],
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
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
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Data Program Studi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.refresh_sharp),
          onPressed: getStudyProgram,
        ),
      ],
    );
  }

  List<Widget> _buildProgramStudiList() {
    return _studyProgramList.map((prodi) {
      return StudyProgramCard(studyProgram: prodi); // ✅ langsung kirim objek
    }).toList();
  }
}
