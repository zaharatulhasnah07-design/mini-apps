import 'package:flutter/material.dart';

class BelanjaPage extends StatefulWidget {
  const BelanjaPage({super.key});

  @override
  State<BelanjaPage> createState() => _BelanjaPageState();
}

class ItemBelanja {
  String nama;
  double harga;

  ItemBelanja({required this.nama, required this.harga});
}

class _BelanjaPageState extends State<BelanjaPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  // Daftar untuk menyimpan item belanja
  final List<ItemBelanja> _daftarBelanja = [];

  // Fungsi untuk menambah item
  void _tambahItem() {
    if (_namaController.text.isNotEmpty && _hargaController.text.isNotEmpty) {
      setState(() {
        String nama = _namaController.text;
        double harga = double.tryParse(_hargaController.text) ?? 0.0;

        _daftarBelanja.add(ItemBelanja(nama: nama, harga: harga));

        // Bersihkan input setelah ditambah
        _namaController.clear();
        _hargaController.clear();
      });
    }
  }

  // Fungsi untuk menghapus item
  void _hapusItem(int index) {
    setState(() {
      _daftarBelanja.removeAt(index);
    });
  }

  // Hitung total harga keseluruhan
  double get _totalHarga {
    return _daftarBelanja.fold(0, (sum, item) => sum + item.harga);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Belanja')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Nama Item
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Item',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            // Input Harga Item
            TextField(
              controller: _hargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Harga (Rp)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            // Tombol Tambah
            ElevatedButton.icon(
              onPressed: _tambahItem,
              icon: const Icon(Icons.add),
              label: const Text('Tambah ke Daftar'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
              ),
            ),
            const SizedBox(height: 16),
            // Informasi Ringkasan Total
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Item: ${_daftarBelanja.length}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total Harga: Rp ${_totalHarga.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Divider(),
            // Daftar List Belanja
            Expanded(
              child: _daftarBelanja.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada item belanjaan.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _daftarBelanja.length,
                      itemBuilder: (context, index) {
                        final item = _daftarBelanja[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              item.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Rp ${item.harga.toStringAsFixed(0)}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _hapusItem(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
