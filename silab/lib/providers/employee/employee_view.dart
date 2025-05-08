// employee_content.dart
import 'package:flutter/material.dart';
import 'package:silab/models/employee.dart';
import 'package:silab/models/staff.dart';
import 'package:silab/providers/employee/employee_card.dart';
import 'package:silab/services/employee_service.dart';
import 'package:silab/widgets/centered_stat_card.dart';
import 'package:silab/widgets/centered_stat_text.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  Future<List<Staff>> getStaff() async {
    return await EmployeeService().fetchStaff();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Staff>>(
      future: getStaff(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final staff = snapshot.data ?? [];

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              CenteredStatCard(
                gradientColors: [Color(0xFFA0A0E8), Color(0xFF53CFC7)],
                children: [
                  CenteredStatText(
                    staff.fold(0, (sum, employee) => sum + (employee.staffStatusId == 1 ? 1 : 0)).toString(),
                    'Dosen'
                  ),
                  CenteredStatText(
                    staff.fold(0, (sum, employee) => sum + (employee.staffStatusId == 2 ? 1 : 0)).toString(),
                    'Administrator'
                  ),
                  CenteredStatText(
                    staff.fold(0, (sum, employee) => sum + (employee.staffStatusId == 3 ? 1 : 0)).toString(),
                    'Teknisi'
                  ),
                ],
              ),

              SizedBox(height: 30,),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                            ),
                          ],
                          ),
                          child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Data Pegawai",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.refresh_sharp),
                          onPressed: () {
                            setState(() {
                              // Trigger a rebuild to refresh the Future
                              getStaff();
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  ListView.builder(
                    itemCount: staff.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final employee = staff[index];
                      return EmployeeCard(staff: employee);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
