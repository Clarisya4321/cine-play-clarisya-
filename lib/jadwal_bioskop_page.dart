import 'package:flutter/material.dart';
import 'data.dart';
import 'detail_jadwal_page.dart';

class JadwalBioskopPage extends StatefulWidget {
  const JadwalBioskopPage({super.key});

  @override
  State<JadwalBioskopPage> createState() => _JadwalBioskopPageState();
}

class _JadwalBioskopPageState extends State<JadwalBioskopPage> {
  final List<Map<String, dynamic>> _studios = [
    {'nama': 'Studio Regular', 'harga': 'Rp 40.000', 'icon': Icons.chair},
    {'nama': 'Studio IMAX 3D', 'harga': 'Rp 75.000', 'icon': Icons.view_in_ar},
    {'nama': 'Velvet VIP', 'harga': 'Rp 120.000', 'icon': Icons.weekend},
  ];

  String? _jadwalTerpilih;

  Future<void> _bukaDetail(String studio) async {
    // await: menunggu nilai yang dikirim balik lewat Navigator.pop
    final hasil = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => DetailJadwalPage(studio: studio)),
    );

    if (hasil != null) {
      setState(() {
        _jadwalTerpilih = hasil;
        riwayatPemesanan.insert(0, hasil); // tampil di Profile
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Jadwal dipilih: $hasil')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jadwal Bioskop')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_jadwalTerpilih != null)
              Card(
                color: Colors.green.shade50,
                child: ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: const Text('Jadwal terpilih'),
                  subtitle: Text(_jadwalTerpilih!),
                ),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Pilih Studio',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _studios.length,
                itemBuilder: (context, index) {
                  final s = _studios[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(s['icon'] as IconData),
                      title: Text(s['nama'] as String),
                      subtitle: Text(s['harga'] as String),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => _bukaDetail(s['nama'] as String),
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
