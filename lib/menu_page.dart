import 'package:flutter/material.dart';

class MenuItem {
  String name;
  int price;
  int qty;

  MenuItem({required this.name, required this.price, this.qty = 0});
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<MenuItem> makanan = [
    MenuItem(name: "Makanan 1", price: 5000, qty: 3), 
    MenuItem(name: "Makanan 2", price: 5000, qty: 2),
    MenuItem(name: "Makanan 3", price: 5000),
    MenuItem(name: "Makanan 4", price: 5000),
    MenuItem(name: "Makanan 5", price: 5000),
  ];

  List<MenuItem> minuman = [
    MenuItem(name: "Minuman 1", price: 7000),
    MenuItem(name: "Minuman 2", price: 7000),
    MenuItem(name: "Minuman 3", price: 7000, qty: 2),
    MenuItem(name: "Minuman 4", price: 7000, qty: 2),
    MenuItem(name: "Minuman 5", price: 7000),
  ];

  Widget buildMenuList(String title, List<MenuItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                // qty box
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Text(
                      item.qty.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // name & price
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.name,
                          style: const TextStyle(fontSize: 14)),
                      Text("Rp. ${item.price}",
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),

                // action buttons
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, size: 18),
                        onPressed: () {
                          setState(() {
                            if (item.qty > 0) item.qty--;
                          });
                        },
                      ),
                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.grey.shade300,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {
                          setState(() {
                            item.qty++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "MENUS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildMenuList("Makanan", makanan),
              const SizedBox(height: 16),
              buildMenuList("Minuman", minuman),
              const SizedBox(height: 20),

              // pagination
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("← Previous",
                      style: TextStyle(color: Colors.grey.shade500)),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black,
                    ),
                    child: const Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("2"),
                  const SizedBox(width: 8),
                  const Text("..."),
                  const SizedBox(width: 8),
                  const Text("4"),
                  const SizedBox(width: 16),
                  Text("Next →",
                      style: TextStyle(color: Colors.grey.shade700)),
                ],
              ),
              const SizedBox(height: 24),

              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Transaction"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Reset"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
