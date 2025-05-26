import 'package:flutter/material.dart';
import 'package:silab/models/item.dart';
import 'package:silab/providers/item/item_card.dart';
import 'package:silab/services/item_service.dart';
import 'package:silab/widgets/centered_stat_card.dart';
import 'package:silab/widgets/centered_stat_text.dart';
// import 'NavBar.dart'as nav;

class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  List<Item> _items = [];

  void initState() {
    super.initState();
    getItems();
  }

  void getItems() async {
    List<Item> items = await ItemService().getItems();
    if (items.isNotEmpty) {
      setState(() {
        _items = items;
      });
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          CenteredStatCard(
            gradientColors: [Color(0xFFA0A0E8), Color(0xFF53CFC7)],
            children: [
              CenteredStatText(
                '0',
                'Barang'
              ),
              CenteredStatText(
                '0',
                'Stok Kosong'
              ),
            ],
          ),

          SizedBox(height: 30,),

          Column(
            children: [
              // Search Bar dan Refresh Button
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

              // Data Barang Text dengan Icon Button di sisi kanan
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(
                  "Data Barang",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.refresh_sharp),
                  onPressed: () {
                  getItems(); // Panggil fungsi getItems() untuk refresh data
                  },
                ),
                ],
              ),
              ),

              // Show LoadingIndicator or List Barang
              _items.isEmpty
                ? Center(
                  child: CircularProgressIndicator(),
                )
                : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                  return ItemCard(_items[index]);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}