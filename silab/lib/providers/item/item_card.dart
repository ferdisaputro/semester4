import 'package:flutter/material.dart';
import 'package:silab/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.itemCode?? 'N/A', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                Row(
                  children: [
                    Text("Stok ", style: TextStyle(fontSize: 14)),
                    Text((item.labItems?.fold(0, (sum, labItem) => sum + (labItem.stock)) ?? 0).toString(), style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(item.itemName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "Jenis ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(
                          text: item.itemType!.itemType,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Icon(Icons.more_horiz, color: Colors.grey),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}