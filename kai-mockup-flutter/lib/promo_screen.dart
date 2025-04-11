import 'package:flutter/material.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  String selectedTab = 'promo'; // tab aktif

  // State untuk filter
  String selectedCity = 'Semua Kota';
  String selectedPromo = 'Semua Promo';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 1),
            _hero(),
            _switch(context),
            (selectedTab == 'promo') ? _filterSection() : _infoSection(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _hero() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Promo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Semua Promo dan Informasi Acces by KAI",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget _switch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 'promo';
                });
              },
              child: Column(
                children: [
                  const Text(
                    "Promo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: selectedTab == 'promo'
                        ? Colors.blue
                        : Colors.grey.shade400,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 'info';
                });
              },
              child: Column(
                children: [
                  const Text(
                    "Information",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: selectedTab == 'info'
                        ? Colors.blue
                        : Colors.grey.shade400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FilterButton(
                  text: selectedCity,
                  options: [
                    'Semua Kota',
                    'Jakarta',
                    'Bandung',
                    'Yogyakarta',
                    'Surabaya',
                    'Semarang'
                  ],
                  onSelected: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilterButton(
                  text: selectedPromo,
                  options: ['Semua Promo', 'Diskon 10%', 'Flash Sale', 'Akhir Pekan'],
                  onSelected: (value) {
                    setState(() {
                      selectedPromo = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const PromoCard(
            imagePath: "assets/images/meow.jpg",
            title: "Promo Spesial Liburan",
            description: "Dapatkan diskon hingga 30% untuk perjalanan ke seluruh kota.",
          ),
          const PromoCard(
            imagePath: "assets/images/promo1.jpg",
            title: "Promo Akhir Pekan",
            description: "Nikmati potongan harga menarik hanya di akhir pekan!",
          ),
          const PromoCard(
            imagePath: "assets/images/promo2.jpg",
            title: "Promo Flash Sale",
            description: "Diskon kilat terbatas waktu, jangan sampai terlewat!",
          ),
        ],
      ),
    );
  }

  Widget _infoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 12),
          PromoCard(
            imagePath: "assets/images/meow.jpg",
            title: "Perubahan Jadwal",
            description: "Jadwal keberangkatan mengalami perubahan mulai bulan depan.",
          ),
          PromoCard(
            imagePath: "assets/images/meow.jpg",
            title: "Pembaruan Aplikasi",
            description: "Aplikasi Acces by KAI telah diperbarui ke versi terbaru.",
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final List<String> options;
  final void Function(String)? onSelected;

  const FilterButton({
    super.key,
    required this.text,
    required this.options,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                ...options.map(
                  (option) => ListTile(
                    title: Text(option),
                    onTap: () {
                      Navigator.pop(context);
                      if (onSelected != null) onSelected!(option);
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.blue.shade50,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.blueAccent),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_drop_down, color: Colors.blue),
        ],
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const PromoCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
