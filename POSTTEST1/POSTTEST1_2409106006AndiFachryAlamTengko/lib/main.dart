import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp digunakan sebagai pembungkus utama aplikasi
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Catalog',

      // Theme digunakan untuk mengatur tampilan umum aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
        ),
      ),

      // Menentukan halaman pertama yang ditampilkan
      home: const HomePage(),
    );
  }
}

// Halaman utama katalog jam tangan
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea agar isi tidak tertutup bagian perangkat
      body: SafeArea(
        // SingleChildScrollView membuat halaman dapat di-scroll
        child: SingleChildScrollView(
          // Padding memberikan jarak isi dari sisi layar
          child: Padding(
            padding: const EdgeInsets.all(20),

            // Column menyusun isi halaman secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Row menyusun nama aplikasi dan icon secara horizontal
                Row(
                  children: [
                    // Expanded membuat nama aplikasi mengisi ruang yang tersedia
                    Expanded(
                      child: Text(
                        'WATCH CATALOG',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Icon digunakan untuk menampilkan icon jam
                    Icon(
                      Icons.watch,
                      size: 30,
                      color: Colors.brown,
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                SizedBox(height: 25),

                // Text judul halaman
                Text(
                  'Temukan Jam Tangan Favoritmu',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                // Text deskripsi singkat
                Text(
                  'Lihat berbagai pilihan jam tangan dalam satu katalog.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 20),

                // Container digunakan untuk membungkus TextField
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),

                  // BoxDecoration mengatur tampilan Container
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  // TextField digunakan untuk mencari jam tangan
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari jam tangan...',
                      border: InputBorder.none,

                      // Icon pencarian berada di bagian kanan TextField
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                // Text bagian kategori
                Text(
                  'Kategori',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                // Row untuk menyusun kategori secara horizontal
                Row(
                  children: [

                    // Expanded membuat ukuran kategori seimbang
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // Column menyusun icon dan text secara vertikal
                        child: Column(
                          children: [
                            // Icon kategori jam pria
                            Icon(
                              Icons.watch,
                              size: 30,
                              color: Colors.brown,
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Pria',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Column(
                          children: [
                            // Icon kategori jam wanita
                            Icon(
                              Icons.watch,
                              size: 30,
                              color: Colors.brown,
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Wanita',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Column(
                          children: [
                            // Icon kategori jam sport
                            Icon(
                              Icons.timer,
                              size: 30,
                              color: Colors.brown,
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Sport',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                // Text bagian katalog
                Text(
                  'Katalog Jam Tangan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                // Card jam tangan pertama
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    // Border untuk membuat garis pada card
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),

                    borderRadius: BorderRadius.circular(12),
                  ),

                  // Row menyusun icon dan informasi jam
                  child: Row(
                    children: [

                      // Container sebagai tempat icon jam
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Icon(
                          Icons.watch,
                          size: 45,
                          color: Colors.brown,
                        ),
                      ),

                      SizedBox(width: 15),

                      // Expanded membuat informasi mengisi ruang yang tersisa
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Classic Leather',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Rp850.000',
                              style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Jam tangan klasik',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Icon untuk menunjukkan detail
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12),

                // Card jam tangan kedua
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    children: [

                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Icon(
                          Icons.watch,
                          size: 45,
                          color: Colors.brown,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sport Chronograph',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Rp1.250.000',
                              style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Jam tangan sporty',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12),

                // Card jam tangan ketiga
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    children: [

                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Icon(
                          Icons.watch,
                          size: 45,
                          color: Colors.brown,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Elegant Silver',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Rp1.500.000',
                              style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Jam tangan elegan',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}