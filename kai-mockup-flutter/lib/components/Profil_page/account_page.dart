import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mockup_ki/primary_colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class SimplePage extends StatelessWidget {
  final String title;

  const SimplePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(title),
      ),
    );
  }
}

class _AccountPageState extends State<AccountPage> {
  bool isIndonesian = true;

  String getLabel(String key) {
    Map<String, String> en = {
      "Ganti Kata Sandi": "Change Password",
      "Riwayat Transaksi": "Transaction History",
      "Member Benefit": "Member Benefit",
      "Daftar Penumpang": "Passenger List",
      "Metode Pembayaran Saya": "My Payment Methods",
      "Registrasi Face Recognition": "Face Recognition Registration",
      "Pusat Bantuan": "Help Center",
      "Tentang Access": "About Access",
      "Bahasa": "Language",
      "Keluar": "Logout",
      "Lihat Profil": "View Profile",
      "QR Code": "QR Code"
    };

    return isIndonesian ? key : (en[key] ?? key);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MemberSection(),
            SizedBox(height: 5),
            _buildMenuList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuList() {
    return Column(
      children: [
        _buildMenuItem(
          Container(
            width: 20,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Icon(
                Icons.key,
                color: Colors.white,
                size: 13,
              ),
            ),
          ),
          getLabel("Ganti Kata Sandi"),
          onTap: () => _navigate(getLabel("Ganti Kata Sandi")),
        ),
        _buildMenuItem(
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(3.1416),
            child: Icon(Icons.article, color: Colors.grey[700]),
          ),
          getLabel("Riwayat Transaksi"),
          onTap: () => _navigate(getLabel("Riwayat Transaksi")),
        ),
        _buildMenuItem(
          Icon(Icons.account_circle_sharp, color: Colors.grey[700]),
          getLabel("Member Benefit"),
          onTap: () => _navigate(getLabel("Member Benefit")),
        ),
        _buildMenuItem(
          Icon(Icons.group_sharp, color: Colors.grey[700]),
          getLabel("Daftar Penumpang"),
          onTap: () => _navigate(getLabel("Daftar Penumpang")),
        ),
        _buildMenuItem(
          Icon(Icons.wallet_outlined, color: Colors.grey[700]),
          getLabel("Metode Pembayaran Saya"),
          onTap: () => _navigate(getLabel("Metode Pembayaran Saya")),
        ),
        _buildMenuItem(
          Icon(Icons.face_5_sharp, color: Colors.grey[700]),
          getLabel("Registrasi Face Recognition"),
          onTap: () => _navigate(getLabel("Registrasi Face Recognition")),
        ),
        _buildMenuItem(
          Icon(Icons.help_rounded, color: Colors.grey[700]),
          getLabel("Pusat Bantuan"),
          onTap: () => _navigate(getLabel("Pusat Bantuan")),
        ),
        _buildMenuItem(
          Icon(Icons.info, color: Colors.grey[700]),
          getLabel("Tentang Access"),
          onTap: () => _navigate(getLabel("Tentang Access")),
        ),
        _buildMenuItem(
          Icon(Icons.language_sharp, color: Colors.grey[700]),
          getLabel("Bahasa"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  isIndonesian ? "ID" : "EN",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Switch(
                value: isIndonesian,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    isIndonesian = value;
                  });
                },
              ),
            ],
          ),
        ),
        _buildMenuItem(
          Icon(Icons.logout_sharp, color: Colors.grey[700]),
          getLabel("Keluar"),
          onTap: () {},
        ),
      ],
    );
  }

  void _navigate(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SimplePage(title: title)),
    );
  }

  Widget _buildMenuItem(Widget icon, String label,
      {bool titleBold = false, Widget? trailing, VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          trailing: trailing ??
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
              ),
          onTap: onTap,
        ),
        _buildDivider(),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Divider(height: 1, thickness: 0.1, color: Colors.grey),
    );
  }

  Widget _MemberSection() {
    return Stack(
      children: [
        Column(
          children: [
            _member(),
            SizedBox(height: 60),
          ],
        ),
        Positioned(
          bottom: 5,
          left: 16,
          right: 16,
          child: _buildMember(),
        )
      ],
    );
  }

  Widget _member() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [0, 0.2, 1],
              colors: [PrimaryColors.purple, PrimaryColors.purple, PrimaryColors.lightPurple],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
            child: Container(height: 100),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              'assets/images/city.png',
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMember() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.orange,
                child: Text(
                  "MS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Politeknik Negeri Jember PSDKU Sidoarjo",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset('assets/icons/coin.png', height: 23, width: 23),
                        SizedBox(width: 4),
                        Text(
                          "Premium Member | RAE418",
                          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildButton(Icons.person_outline, getLabel("Lihat Profil"))),
              SizedBox(width: 8),
              Expanded(child: _buildButton(LucideIcons.scanLine, getLabel("QR Code"))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: Colors.black),
      label: Text(
        label,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}