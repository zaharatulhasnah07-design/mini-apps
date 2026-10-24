import 'package:flutter/material.dart';

import 'kata_page.dart'; // Impor file penghitung kata

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Mandiri Penghitung Kata',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const KataPage(), // Panggil halaman penghitung kata
    );
  }
}
