import 'package:flutter/material.dart';

class SuhuPage extends StatefulWidget {
  const SuhuPage({super.key});

  @override
  State<SuhuPage> createState() => _SuhuPageState();
}

class _SuhuPageState extends State<SuhuPage> {
  // menyimpan nilai input Celsius dan hasil Fahrenheit
  double celsius = 0.0;
  double fahrenheit = 32.0;

  // menghitung konversi suhu secara real-time
  void hitungFahrenheit(String value) {
    setState(() {
      if (value.isNotEmpty) {
        celsius = double.tryParse(value) ?? 0.0;
      } else {
        celsius = 0.0;
      }
      // Rumus konversi Celsius ke Fahrenheit: (C * 9/5) + 32
      fahrenheit = (celsius * 9 / 5) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Konversi Suhu')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Masukkan Suhu dalam Celsius:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            // Input suhu dalam Celsius
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Contoh: 30',
                suffixText: '°C',
              ),
              onChanged: hitungFahrenheit,
            ),
            const SizedBox(height: 32),
            const Text(
              'Hasil Konversi ke Fahrenheit:',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            // Tampilkan hasil
            Text(
              '${fahrenheit.toStringAsFixed(1)} °F',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 182, 214, 241),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
