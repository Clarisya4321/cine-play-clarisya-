import 'package:flutter/material.dart';

class DetailMoviePage extends StatelessWidget {
  final String judul;
  final String genre;
  final String rating;
  final String sinopsis;

  const DetailMoviePage({
    super.key,
    required this.judul,
    required this.genre,
    required this.rating,
    required this.sinopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.movie, size: 80),
            ),
            const SizedBox(height: 16),
            Text(
              judul,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Genre : $genre'),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, size: 18, color: Colors.amber),
                const SizedBox(width: 4),
                Text('Rating : $rating'),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Sinopsis',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(sinopsis),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
