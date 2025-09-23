import 'package:flutter/material.dart';
import 'menu_page.dart'; // import file halaman menu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Menu App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuPage(), // arahkan ke MenuPage
    );
  }
}
