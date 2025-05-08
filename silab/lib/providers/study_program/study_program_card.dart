import 'package:flutter/material.dart';
import 'package:silab/models/study_program.dart';

class StudyProgramCard extends StatelessWidget {
  final StudyProgram studyProgram;

  const StudyProgramCard({super.key, required this.studyProgram});

  @override
  Widget build(BuildContext context) {
    final String kode = studyProgram.code ?? '—';
    final String nama = studyProgram.studyProgramName ?? '—';
    final String jurusan = studyProgram.department?.department ?? '—';
    final String ketua = studyProgram.headOfStudyProgramName ?? 'Belum Ditentukan';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  kode,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                const Spacer(),
                const Icon(Icons.more_horiz, color: Colors.black),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              nama,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Column(
              children: [
                _buildInfoRow("Jurusan", jurusan),
                _buildInfoRow("Ketua Prodi", ketua),
          ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: const TextStyle(color: Colors.black54)),
          ),
          const Text(":", style: TextStyle(color: Colors.black54)),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
