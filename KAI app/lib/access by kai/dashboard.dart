import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'bottom_nav.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNavBar(), //tampilan pertama aplikasi
  ));
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Struktur UI
      body: SingleChildScrollView( //bisa scroll jika kontennya lebih panjang dari layar
        child: Column( //elemen UI vertical dalam 1 kolom
          children: [
            _buildHeader(),
            _buildKaiPayCard(),
            _buildMenuKategori(),
            _buildBottomMenu(),
            _buildTripPlanner(),
            _buildPromoTerbaru(),
            _buildTujuanPopuler(),
            _buildTukarRailpoin(),
            _buildArtikelMenarik(),
          ],
        ),
      ),
    );
  }

  //HEADERRR
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40), //ruang kosong di dalam container, samping 20px, atas-bawah 40px
      decoration: const BoxDecoration( //latar belakang
        gradient: LinearGradient(
          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], //warna biru-ungu
          begin: Alignment.topLeft, //dimulai pojok kiri atas
          end: Alignment.bottomRight, //diakhiri pojok kanan bawah
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //teks di kiri, ikon di kanan
        children: [
          Expanded(
            child: Column( //karena ada dua baris teks, digunakan Column agar tersusun ke bawah
              crossAxisAlignment: CrossAxisAlignment.start, //teks rata kiri
              children: const [
                Text("Selamat Siang", style: TextStyle(color: Colors.white, fontSize: 16)),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "RATIH MARATUS SHOLIHAH",
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row( //karena ada beberapa ikon, digunakan Row agar ikon tersusun dalam satu baris
            children: [
              IconButton(icon: const Icon(LucideIcons.shoppingCart, color: Colors.white), onPressed: () {}), //onPressed = action button
              IconButton(icon: const Icon(LucideIcons.mail, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(LucideIcons.helpCircle, color: Colors.white), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  //MENU KATEGORII
  Widget _buildMenuKategori() {
    List<Map<String, dynamic>> categories = [
      {"icon": LucideIcons.train, "label": "Antar Kota", "color1": Color(0xFF3A5ADF), "color2": Color(0xFF6C8DF7)}, // Biru gradasi
      {"icon": LucideIcons.train, "label": "Lokal", "color1": Color(0xFFF58529), "color2": Color(0xFFFEDA77)}, // Orange gradasi
      {"icon": LucideIcons.train, "label": "Commuter Line", "color1": Color(0xFFD31A50), "color2": Color(0xFFF4511E)}, // Merah gradasi
      {"icon": LucideIcons.train, "label": "LRT", "color1": Color(0xFFAA00FF), "color2": Color(0xFFE040FB)}, // Ungu gradasi
      {"icon": LucideIcons.train, "label": "Bandara", "color1": Color(0xFF0091EA), "color2": Color(0xFF40C4FF)}, // Biru langit gradasi
      {"icon": LucideIcons.flashlight, "label": "Whoosh", "color1": Color(0xFFB71C1C), "color2": Color(0xFFD32F2F)}, // Merah pekat gradasi
    ];

    return SizedBox(
      height: 120, //tinggi widget
      child: SingleChildScrollView( //kategori bisa di scroll secara horizontal
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(), //efek pantulan saat scroll mencapai ujung
        padding: const EdgeInsets.symmetric(horizontal: 16.0), //jarak kiri-kanan
        child: Row( //mengatur agar semua kategori disusun dalam satu baris horizontal
          mainAxisAlignment: MainAxisAlignment.center, // ikon berada di tengah
          children: categories //mengonversi setiap kategori dalam categories menjadi widget ikon
              .map((category) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12), // Menyesuaikan jarak antar ikon
            child: _categoryIconn( //membuat tampilan ikon dan label
              category['icon'],
              category['label'],
              category['color1'],
              category['color2'],
            ),
          ))
              .toList(),
        ),
      ),
    );
  }

  Widget _categoryIconn(IconData icon, String label, Color color1, Color color2) {
    return Column( //menyusun ikon dan label dalam satu kolom (atas-bawah)
      children: [
        Container( // lingkaran sebagai latar belakang ikon
          width: 75, // Ukuran lingkaran
          height: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle, //membuat bentuk bulat
            gradient: LinearGradient(
              colors: [color1, color2], // Gradasi warna sesuai contoh
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Icon(icon, size: 40, color: Colors.white), // ukuran dan warna ikon
          ),
        ),
        const SizedBox(height: 6), //jaral antara ikon dan label
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600, //jenis font
            color: Colors.black,
          ),
          textAlign: TextAlign.center, //teks rata tengah
        ),
      ],
    );
  }

  //MENU KATEGORII
  Widget _buildBottomMenu() {
    List<Map<String, dynamic>> bottomCategories = [
      {"icon": LucideIcons.building, "label": "Hotel", "color": Colors.blue.shade100},
      {"icon": LucideIcons.ticket, "label": "Kartu Multi Trip", "color": Colors.blue.shade100},
      {"icon": LucideIcons.package, "label": "KAI Logistik", "color": Colors.blue.shade100},
      {"icon": LucideIcons.moreHorizontal, "label": "Show more", "color": Colors.blue.shade100},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), //jarak vertikal pada menu
      child: Row( //horizontal
        mainAxisAlignment: MainAxisAlignment.center, //menu rata tengah di dalam Row
        children: bottomCategories
            .map((category) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0), //jarak horizontal setiap ikon
          child: _categoryIcon(category['icon'], category['label'], category['color']), //membangun ikon dan label
        ))
            .toList(),
      ),
    );
  }

  Widget _categoryIcon(IconData icon, String label, Color color) {
    return Column( //menyusun ikon dan label secara vertikal
      children: [
        CircleAvatar( //membuat ikon berbentuk lingkaran
          radius: 30, //lingkaran diameter 60px
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 40), //warna dan ukuran ikon
        ),
        const SizedBox(height: 5), //jarak antara ikon dan label
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  //PAYMENT
  Widget _buildKaiPayCard() {
    return Padding(
        padding: const EdgeInsets.all(16.0), //jarak antar elemen
        child: Card( //tampilan berbentuk kartu
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), //sudut cartu
          elevation: 4, //efek bayangan pada kartu
          child: Padding(
            padding: const EdgeInsets.all(16.0), //jarak batas kartu dengan konten
            child: Column( //elemen kartu bentuk vertikal
              children: [
                Row( //ikon bentuk horizontal
                  children: [
                    Icon(LucideIcons.wallet, size: 30, color: Colors.blue), // ukuran dan warna ikon
                    const SizedBox(width: 10), //jarak ikon dan teks
                    const Text("KAI PAY", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10), //jarak vertikal
                Row( //tombol aksi bentuk horizontal
                  mainAxisAlignment: MainAxisAlignment.spaceAround, //membuat tombol-tombol ini tersebar secara merata
                  children: [
                    _iconButton(LucideIcons.checkCircle, "Aktivasi KAI Pay", Colors.blue),
                    _iconButton(LucideIcons.scan, "Scan", Colors.green),
                    _iconButton(LucideIcons.creditCard, "Top Up", Colors.orange),
                    _iconButton(LucideIcons.history, "Riwayat", Colors.grey),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [ //warna, ukuran, dan jarak ikon
                        Icon(LucideIcons.coins, color: Colors.orange),
                        SizedBox(width: 5),
                        Text("0 RailPoint", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), //memberikan ruang dalam kotak
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100, //warna latarbelakang
                        borderRadius: BorderRadius.circular(20), //sudut membulat
                      ),
                      child: Row(
                        children: const [
                          Icon(LucideIcons.star, color: Colors.blue), //ikon bintang
                          SizedBox(width: 5), //jarak
                          Text("Basic", style: TextStyle(fontSize: 16)), //teks dan ukurannya
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }

  Widget _iconButton(IconData icon, String label, Color color) {
    return Column( //agar ikon berada di atas dan teks di bawahnya
      children: [
        Icon(icon, color: color, size: 30), //menampilkan ikon dengan warna dan ukurannya
        const SizedBox(height: 5), //jarak vertikal antara ikon dan teks
        Text(label, style: const TextStyle(fontSize: 12)), //menampilkan label di bawah ikon dengan ukuran fontnya
      ],
    );
  }

  //TRIP PLANNER
  Widget _buildTripPlanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), //membuat sudut kontainer membulat
          gradient: const LinearGradient( //warna latar belakang
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //elemen-elemen di dalam Row tersebar dengan jarak yang merata, memberi ruang di antara teks dan tombol.
          children: [
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("TRIP Planner", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    "Buat perencanaan terbaik untuk perjalananmu.",
                    style: TextStyle(color: Colors.white)
                  ),
                ],
              ),
            ),


            OutlinedButton( //tombol dengan batas luar
              onPressed: () {},
              style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white)),
              child: const Text("BUAT", style: TextStyle(color: Colors.white)), //warna dan teks pada tombol
            )
          ],
        ),
      ),
    );
  }

  //PROMOOO
  Widget _buildPromoTerbaru() {
    List<String> promoImages = [
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",
      "assets/promo.jpeg",// Tambahkan promo baru
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0), //jarak di seluruh sisi kontainer yang membungkus seluruh widget tampilan promo
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //semua elemen dalam kolom terletak di bagian kiri secara horizontal
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //elemen-elemen di dalam Row terdistribusi dengan jarak merata antara kiri dan kanan
            children: [
              const Text("Promo Terbaru", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text("Lihat Semua")),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder( //menampilkan gambar-gambar secara dinamis dari daftar promoImages
              scrollDirection: Axis.horizontal, //gambar-gambar akan scroll secara horizontal
              itemCount: promoImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // memberikan sudut yang membulat
                    child: Image.asset(promoImages[index], width: 200, fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //KOTA TUJUAN POPULER
  Widget _buildTujuanPopuler() {
    List<Map<String, String>> tujuan = [
      {"nama": "Jakarta", "gambar": "assets/kota.jpg"},
      {"nama": "Bandung", "gambar": "assets/kota.jpg"},
      {"nama": "Surabaya", "gambar": "assets/kota.jpg"},
      {"nama": "Yogyakarta", "gambar": "assets/kota.jpg"},
      {"nama": "Bali", "gambar": "assets/kota.jpg"},
      {"nama": "Aceh", "gambar": "assets/kota.jpg"},
      {"nama": "Malaysia", "gambar": "assets/kota.jpg"},
      {"nama": "Singapura", "gambar": "assets/kota.jpg"},
      {"nama": "Korea Selatan", "gambar": "assets/kota.jpg"},
      {"nama": "Jepang", "gambar": "assets/kota.jpg"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0), //jarak di seluruh sisi widget yang membungkus tampilan tujuan populer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //semua elemen dalam kolom terletak di bagian kiri secara horizontal
        children: [
          const Text("Tujuan Populer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10), //jarak vertikal antara judul dan konten di bawahnya
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //daftar tujuan scroll secara horizontal
              itemCount: tujuan.length, // jumlah item yang ditampilkan sama dengan jumlah destinasi dalam daftar tujuan
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), //sudut yang membulat
                    child: Stack(
                      children: [
                        Image.asset(tujuan[index]['gambar']!, width: 200, height: 120, fit: BoxFit.cover),
                        Positioned( //menempatkan nama kota di bagian bawah gambar dengan jarak 10 pixel dari kiri dan bawah
                          bottom: 10,
                          left: 10,
                          child: Text(
                            tujuan[index]['nama']!,
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //TUKAR POINT
  Widget _buildTukarRailpoin() {
    List<Map<String, String>> rewards = [
      {"poin": "500", "deskripsi": "DAPATKAN 25.000 MAPCLUB POINTS", "gambar": "assets/point.jpeg"},
      {"poin": "1.000", "deskripsi": "DAPATKAN 50.000 MAPCLUB POINTS", "gambar": "assets/point.jpeg"},
      {"poin": "5.000", "deskripsi": "DAPATKAN 100.000 MAPCLUB POINTS", "gambar": "assets/point.jpeg"},
      {"poin": "10.000", "deskripsi": "DAPATKAN 500.000 MAPCLUB POINTS", "gambar": "assets/point.jpeg"},
      {"poin": "50.000", "deskripsi": "DAPATKAN 1.000.000 MAPCLUB POINTS", "gambar": "assets/point.jpeg"},
      {"poin": "100.000", "deskripsi": "DAPATKAN 1.150.000 MAPCLUB POINTS", "gambar": "assets/point.jpeg"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0), // jarak di sekitar tampilan konten
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tukar Railpoin mu sekarang",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Lihat Semua",
                  style: TextStyle(color: Colors.blue), //warna teks
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200, // Meningkatkan tinggi agar tidak overflow
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 220, // Lebar tetap
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Sesuaikan ukuran dengan konten
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              rewards[index]["gambar"]!,
                              width: double.infinity,
                              height: 110, // Sesuaikan tinggi gambar
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded( // Pastikan sisa konten tidak menyebabkan overflow
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    rewards[index]["deskripsi"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${rewards[index]["poin"]} Railpoin",
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //ARTIKEL MENARIKK
  Widget _buildArtikelMenarik() {
    List<Map<String, String>> articles = [
      {"image": "assets/artikel.png", "title": "Holiday Vibes Maksimal Bareng KAI di Liburan Nataru 2024"},
      {"image": "assets/artikel.png", "title": "Nyaman Menikmati Perjalanan dengan Fasilitas Baru"},
      {"image": "assets/artikel.png", "title": "Tips Hemat Perjalanan Jauh Menggunakan Kereta"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Artikel Menarik",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Lihat Semua"),
              ),
            ],
          ),
          SizedBox(
            height: 160, // Menambah tinggi agar tidak overflow
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Sesuaikan ukuran dengan konten
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            articles[index]['image']!,
                            width: 200,
                            height: 100, // Pastikan tinggi gambar tetap
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Expanded( // Gunakan Expanded agar teks tidak melebihi batas
                          child: Text(
                            articles[index]['title']!,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


}
