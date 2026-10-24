import 'package:flutter/material.dart';

class KataPage extends StatefulWidget {
  const KataPage({super.key});

  @override
  State<KataPage> createState() => _KataPageState();
}

class _KataPageState extends State<KataPage> {
  int _jumlahKarakter = 0;
  int _jumlahKata = 0;

  // Fungsi untuk menghitung karakter dan kata secara real-time
  void _hitungTeks(String text) {
    setState(() {
      _jumlahKarakter = text.length;

      // Menghitung jumlah kata berdasarkan spasi
      if (text.trim().isEmpty) {
        _jumlahKata = 0;
      } else {
        // Memecah teks menggunakan spasi dan menyaring elemen kosong
        List<String> kataList = text.trim().split(RegExp(r'\s+'));
        _jumlahKata = kataList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Penghitung Kata')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Kotak Input Teks
            TextField(
              maxLines: 5,
              onChanged: _hitungTeks,
              decoration: const InputDecoration(
                hintText: 'Ketik atau tempel teks di sini...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Kotak Informasi Hasil Perhitungan (Real-time)
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Kata',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$_jumlahKata',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Karakter',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$_jumlahKarakter',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
