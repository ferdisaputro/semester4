import 'package:flutter/material.dart';
import 'package:silab/models/laboratory.dart';
class LaboratoryCard extends StatelessWidget {
  final Laboratory lab;

  const LaboratoryCard({super.key, required this.lab});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lab.code ?? "-",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const Icon(Icons.more_horiz, color: Colors.black),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            lab.laboratoryName ?? "-",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.black26),
          const SizedBox(height: 4),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Ka. Laboratorium",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const Text(":", style: TextStyle(color: Colors.black54)),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                   lab.formatedHeadOfLab != null &&
                      lab.formatedHeadOfLab!.any((e) => e.isLabLeader == 1)
                  ? lab.formatedHeadOfLab!
                      .where((e) => e.isLabLeader == 1)
                      .map((e) => e.name)
                      .join(", ")
                  : "-",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
