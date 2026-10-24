import 'package:flutter/material.dart';

class KuisPage extends StatefulWidget {
  const KuisPage({super.key});

  @override
  State<KuisPage> createState() => _KuisPageState();
}

// Model untuk pertanyaan kuis
class Pertanyaan {
  final String soal;
  final List<String> pilihan;
  final int jawabanIndex;

  Pertanyaan({
    required this.soal,
    required this.pilihan,
    required this.jawabanIndex,
  });
}

class _KuisPageState extends State<KuisPage> {
  // Daftar pertanyaan kuis
  final List<Pertanyaan> _daftarSoal = [
    Pertanyaan(
      soal: 'Diplanet apa kita tinggal saat ini?',
      pilihan: ['mars', 'bumi', 'jupiter', 'saturnus'],
      jawabanIndex: 1,
    ),
    Pertanyaan(
      soal: 'siapa penulis novel laskar pelangi?',
      pilihan: ['andrea hirata', 'jokowi', 'prabowo', 'donald trump'],
      jawabanIndex: 0,
    ),
    Pertanyaan(
      soal: 'apa nama jakarta pada masa kolonial?',
      pilihan: ['kolonia', 'batavia', 'palapa', 'botania'],
      jawabanIndex: 1,
    ),
  ];

  int _indeksSoal = 0;
  int _skor = 0;
  bool _kuisSelesai = false;

  void _pilihJawaban(int indexPilihan) {
    // Cek apakah jawaban benar
    if (indexPilihan == _daftarSoal[_indeksSoal].jawabanIndex) {
      _skor += 10; // Tambah skor 10 jika benar
    }

    setState(() {
      if (_indeksSoal < _daftarSoal.length - 1) {
        _indeksSoal++;
      } else {
        _kuisSelesai = true;
      }
    });
  }

  void _ulangiKuis() {
    setState(() {
      _indeksSoal = 0;
      _skor = 0;
      _kuisSelesai = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final soalAktif = _daftarSoal[_indeksSoal];

    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Kuis Sederhana')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _kuisSelesai
            ? Center(
                // Tampilan Skor Akhir
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Kuis Selesai!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Skor Akhir Kamu: $_skor',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Tombol Ulangi Kuis
                    ElevatedButton.icon(
                      onPressed: _ulangiKuis,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Ulangi Kuis'),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Indeks Pertanyaan & Skor
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pertanyaan ${_indeksSoal + 1} dari ${_daftarSoal.length}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Skor: $_skor',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Kotak Soal
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Text(
                      soalAktif.soal,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Pilihan Ganda (4 Pilihan)
                  ...List.generate(
                    soalAktif.pilihan.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () => _pilihJawaban(index),
                        child: Text(
                          '${String.fromCharCode(65 + index)}. ${soalAktif.pilihan[index]}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
