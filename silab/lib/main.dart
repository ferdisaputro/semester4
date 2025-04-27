import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/account.dart';
import 'package:silab/assets/primary_colors.dart';
import 'package:silab/bottom_navigation.dart';
import 'package:silab/dashboard.dart';
import 'package:silab/jurusan.dart';
import 'package:silab/laboratorium.dart';
import 'package:silab/pegawai.dart';
import 'package:silab/barang.dart';
import 'package:silab/permission.dart';
import 'package:silab/program_studi.dart';
import 'package:silab/providers/navigation_provider.dart';
import 'package:silab/role.dart';
import 'package:silab/satuan.dart';
import 'login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider())
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
    AccountPage(),
    pegawaiPage(),
    rolePage(),
    permissionPage(),
    jurusanPage(),
    programstudiPage(),
    satuanPage(),
    barangPage(),
    labPage(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final _navigationProvider = Provider.of<NavigationProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SiLAB',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.white
      ),
      home: Scaffold(
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
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: _pages[_navigationProvider.selectedIndex ],
        ),
        bottomNavigationBar: BottomNavigation()
      ),
    );
  }
}
