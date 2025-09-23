import 'package:flutter/material.dart';
import 'package:mini_project_selatan/total_page.';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<int> makananCount = [0, 0, 0, 0, 0];
  List<int> minumanCount = [0, 0, 0, 0, 0];

  void resetPesanan() {
    setState(() {
      makananCount = List.filled(makananCount.length, 0);
      minumanCount = List.filled(minumanCount.length, 0);
    });
  }

  void tambahMakanan(int index) {
    setState(() {
      makananCount[index]++;
    });
  }

  void kurangMakanan(int index) {
    setState(() {
      if (makananCount[index] > 0) makananCount[index]--;
    });
  }

  void tambahMinuman(int index) {
    setState(() {
      minumanCount[index]++;
    });
  }

  void kurangMinuman(int index) {
    setState(() {
      if (minumanCount[index] > 0) minumanCount[index]--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MENUS", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              const Text("Makanan", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              for (int i = 0; i < makananCount.length; i++)
                buildItemRow(
                  title: "Makanan ${i + 1}",
                  price: "Rp. 5000",
                  count: makananCount[i],
                  onAdd: () => tambahMakanan(i),
                  onRemove: () => kurangMakanan(i),
                ),
              const SizedBox(height: 16),
              const Text("Minuman", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              for (int i = 0; i < minumanCount.length; i++)
                buildItemRow(
                  title: "Minuman ${i + 1}",
                  price: "Rp. 7000",
                  count: minumanCount[i],
                  onAdd: () => tambahMinuman(i),
                  onRemove: () => kurangMinuman(i),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TotalPage(
                            makananCount: makananCount,
                            minumanCount: minumanCount,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Transaction"),
                  ),
                  ElevatedButton(
                    onPressed: resetPesanan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk 1 row item
  Widget buildItemRow({
    required String title,
    required String price,
    required int count,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.grey.shade200,
            child: Text("$count", style: const TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(title),
            ),
          ),
          Text(price),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onRemove,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onAdd,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
