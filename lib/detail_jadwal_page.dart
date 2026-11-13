import 'package:flutter/material.dart';
import 'data.dart';

class DetailJadwalPage extends StatelessWidget {
  final String studio;

  const DetailJadwalPage({super.key, required this.studio});

  // Jam tayang dummy untuk setiap film
  static const Map<String, List<String>> _jam = {
    'Avatar 3': ['12:00', '15:30', '19:00'],
    'Spider-Man': ['13:00', '16:00', '20:00'],
    'Inception': ['14:00', '17:30', '21:00'],
    'Resident Evil': ['15:00', '18:30', '22:00'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jadwal - $studio')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          for (final film in daftarFilm)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(film.judul,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        for (final jam in _jam[film.judul]!)
                          ActionChip(
                            label: Text(jam),
                            onPressed: () {
                              // Kirim nilai terpilih kembali ke halaman sebelumnya
                              Navigator.pop(
                                  context, '${film.judul} - $studio - $jam');
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
