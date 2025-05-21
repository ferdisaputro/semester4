import 'package:flutter/material.dart';
import 'package:silab/models/department.dart';
import 'package:silab/services/department_service.dart';
import 'package:silab/providers/AppBar.dart';
import 'package:silab/providers/bottom_navigation.dart';
import 'package:silab/widgets/centered_stat_card.dart';
import 'package:silab/widgets/centered_stat_text.dart';
import 'package:silab/providers/department/department_card.dart';

class DepartmentView extends StatefulWidget {

  const DepartmentView({super.key});

  @override
  State<DepartmentView> createState() => _DepartmentViewState();
}

class _DepartmentViewState extends State<DepartmentView> {
  late Future<List<Department>> futureDepartments;

  @override
  void initState() {
    super.initState();
    futureDepartments = DepartmentService().fetchDepartments();
  }

  @override
  Widget build(BuildContext context) {
    int _departmentCount = 0;
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Statistik Jurusan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FutureBuilder<List<Department>>(
                future: futureDepartments,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Tidak ada data jurusan.');
                  }

                  final jurusanList = snapshot.data!;

                  return CenteredStatCard(
                    gradientColors: const [Color(0xFFA0A0E8), Color(0xFF53CFC7)],
                    children: [
                      CenteredStatText(jurusanList.length.toString(), 'Jurusan'),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
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
              ),
            ),

            const SizedBox(height: 20),

            // Header + Refresh
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Data Jurusan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh_sharp),
                    onPressed: () {
                      setState(() {
                        futureDepartments = DepartmentService().fetchDepartments();
                      });
                    },
                  ),
                ],
              ),
            ),

            // FutureBuilder untuk load data
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FutureBuilder<List<Department>>(
                future: futureDepartments,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Tidak ada data jurusan.');
                  }

                  final jurusanList = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: jurusanList.length,
                    itemBuilder: (context, index) {
                      final jurusan = jurusanList[index];
                      return DepartmentCard(jurusan: jurusan);
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      );
  }
}
