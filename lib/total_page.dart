import 'package:flutter/material.dart';

class TotalPage extends StatelessWidget {
  final List<int> makananCount;
  final List<int> minumanCount;

  const TotalPage({
    super.key,
    required this.makananCount,
    required this.minumanCount,
  });

  @override
  Widget build(BuildContext context) {
    // List untuk menampung semua pesanan
    List<Map<String, dynamic>> pesanan = [];

    // Tambahkan makanan
    for (int i = 0; i < makananCount.length; i++) {
      if (makananCount[i] > 0) {
        pesanan.add({
          "jumlah": makananCount[i],
          "item": "Makanan ${i + 1}",
          "harga": 5000,
        });
      }
    }

    // Tambahkan minuman
    for (int i = 0; i < minumanCount.length; i++) {
      if (minumanCount[i] > 0) {
        pesanan.add({
          "jumlah": minumanCount[i],
          "item": "Minuman ${i + 1}",
          "harga": 7000,
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("TOTAL", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Jumlah", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Item", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),

            // Daftar pesanan
            Expanded(
              child: ListView.builder(
                itemCount: pesanan.length,
                itemBuilder: (context, index) {
                  var item = pesanan[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.grey.shade200,
                          child: Text("${item['jumlah']}", style: const TextStyle(fontSize: 12)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(item['item']),
                          ),
                        ),
                        Text("Rp. ${item['harga']}"),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Fungsi bayar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white, // teks jadi putih
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("Bayar"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white, // teks jadi putih
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("Batal"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}