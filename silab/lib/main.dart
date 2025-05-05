import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/providers/account.dart';
import 'package:silab/config/primary_colors.dart';
import 'package:silab/providers/bottom_navigation.dart';
import 'package:silab/providers/dashboard.dart';
import 'package:silab/providers/department.dart';
import 'package:silab/providers/equipment_loan/equipment_loan_view.dart';
import 'package:silab/providers/employee/employee_view.dart';
import 'package:silab/providers/laboratory.dart';
import 'package:silab/providers/employee.dart';
import 'package:silab/providers/item.dart';
import 'package:silab/providers/login.dart';
import 'package:silab/providers/permission.dart';
import 'package:silab/providers/auth_provider.dart';
import 'package:silab/providers/study_program.dart';
import 'package:silab/providers/navigation_provider.dart';
import 'package:silab/providers/role.dart';
import 'package:silab/providers/unit.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final List<Widget> _pages = [
    DashboardPage(),
    Placeholder(),
    Account(),
    Employee(),
    // Login(),
    // Employee(),
    EmployeeView(),
    Role(),
    Permission(),
    Department(),
    StudyProgram(),
    Unit(),
    Item(),
    Laboratory(),
    EquipmentLoanView()
    // Login(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SiLAB',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.white
      ),
      home: context.watch<AuthProvider>().isAuthenticated? 
        Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0), // height of AppBar
            child: Container(
              decoration: BoxDecoration(
                color: PrimaryColors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 8),
                  )
                ]
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                title: AnimatedAlign(
                  alignment: context.watch<NavigationProvider>().selectedIndex == 0? Alignment.center : Alignment.centerLeft, 
                  duration: Duration(milliseconds: 150),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset('assets/silab.png'),
                  ),
                )
              ),
            ),
          ),
          body: _pages[navigationProvider.selectedIndex ],
          bottomNavigationBar: BottomNavigation()
        ) : Login(),
    );
  }
}
