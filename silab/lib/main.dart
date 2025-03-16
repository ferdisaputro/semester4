import 'package:flutter/material.dart';
import 'package:silab/dashboard.dart';
import 'package:silab/jurusan.dart';
import 'package:silab/laboratorium.dart';
import 'package:silab/pegawai.dart';
import 'package:silab/barang.dart';
import 'package:silab/permission.dart';
import 'package:silab/program_studi.dart';
import 'package:silab/role.dart';
import 'package:silab/satuan.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SiLAB',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: LoginPage(),
      // home: DashboardPage(),
      // home: pegawaiPage(),
      // home: barangPage(),
      // home: satuanPage(),
      // home: permissionPage(),
      // home: programstudiPage(),
      // home: labPage(),
      // home: jurusanPage(),
      home: rolePage(),
    );
  }
}
