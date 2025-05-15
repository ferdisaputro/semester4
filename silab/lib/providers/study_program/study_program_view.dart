import 'package:flutter/material.dart';
import 'package:silab/models/study_program.dart';
import 'package:silab/services/study_program_service.dart';
import 'package:silab/widgets/centered_stat_card.dart';
import 'package:silab/widgets/centered_stat_text.dart';
import 'study_program_card.dart';

class StudyProgramView extends StatefulWidget {
  const StudyProgramView({super.key});

  @override
  State<StudyProgramView> createState() => _StudyProgramViewState();
}

class _StudyProgramViewState extends State<StudyProgramView> {
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
          _statCard(),
          const SizedBox(height: 30),
          _buildSearchField(),
          const SizedBox(height: 20),
          _buildHeader(),
          _studyProgramList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: _buildProgramStudiList(),
              ),
        ],
      ),
    );
  }

  Widget _statCard() {
    return CenteredStatCard(
      gradientColors: [Color(0xFF34CA86), Color(0xFF4ED1C2)],
      children: [
        CenteredStatText(_studyProgramList.length.toString(), "Total Program Studi")
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
