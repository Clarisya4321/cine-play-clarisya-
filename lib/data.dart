// Data dummy yang dipakai di beberapa halaman.

class Movie {
  final String judul;
  final String genre;
  final String rating;
  final String sinopsis;

  const Movie(this.judul, this.genre, this.rating, this.sinopsis);
}

const List<Movie> daftarFilm = [
  Movie(
    'Avatar 3',
    'Sci-Fi / Petualangan',
    '8.2',
    'Jake Sully dan keluarganya menjelajahi sisi baru Pandora dan bertemu '
        'suku Na\'vi yang hidup di tengah api dan abu.',
  ),
  Movie(
    'Spider-Man',
    'Aksi / Superhero',
    '8.0',
    'Peter Parker harus menyeimbangkan kehidupan sekolah dengan tanggung '
        'jawabnya sebagai pahlawan penjaga kota.',
  ),
  Movie(
    'Inception',
    'Sci-Fi / Thriller',
    '8.8',
    'Seorang pencuri yang mencuri rahasia lewat mimpi diberi misi mustahil: '
        'menanamkan sebuah ide ke dalam pikiran target.',
  ),
  Movie(
    'Resident Evil',
    'Horor / Aksi',
    '6.7',
    'Sekelompok penyintas berjuang keluar dari fasilitas rahasia yang '
        'dipenuhi hasil eksperimen virus mematikan.',
  ),
];

// Riwayat pemesanan (dummy). Bertambah saat user memilih jadwal.
final List<String> riwayatPemesanan = [
  'Inception - Studio Regular - 14:00',
  'Spider-Man - Studio IMAX 3D - 19:30',
];
