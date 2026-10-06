import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'detail_page.dart';

// HomePage: halaman utama katalog jam tangan menggunakan Consumer Provider
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer digunakan untuk mendengarkan perubahan data dari CartProvider secara reaktif[cite: 7]
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        // Filter produk berdasarkan pencarian (search query)
        final visibleProducts = cartProvider.products.where((product) {
          return product.nama.toLowerCase().contains(cartProvider.searchQuery);
        }).toList();

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
                          // Text nama aplikasi
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

                    // SizedBox memberikan jarak
                    SizedBox(height: 6),

                    // Text deskripsi singkat
                    Text(
                      'Lihat berbagai pilihan jam tangan dalam satu katalog.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),

                    // SizedBox memberikan jarak
                    SizedBox(height: 20),

                    // Container digunakan untuk membungkus TextField pencarian
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),

                      // BoxDecoration mengatur tampilan Container
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      // TextField digunakan untuk mencari jam tangan secara stateful via provider
                      child: TextField(
                        onChanged: (value) {
                          // Mengubah state query pencarian melalui provider tanpa rebuild seluruh widget besar
                          cartProvider.setSearchQuery(value);
                        },
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

                    // SizedBox memberikan jarak
                    SizedBox(height: 20),

                    // Container untuk banner, clipBehavior agar gambar ikut melengkung
                    Container(
                      height: 150,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      // Stack menumpuk gambar banner dengan tulisan di atasnya
                      child: Stack(
                        children: [
                          // Image.asset menampilkan gambar banner dari folder assets
                          Image.asset(
                            'assets/classicleather.JPG',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),

                          // Positioned meletakkan tulisan di pojok kiri bawah banner
                          Positioned(
                            left: 15,
                            bottom: 15,

                            // Column menyusun dua teks banner secara vertikal
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text judul banner
                                Text(
                                  'Koleksi Terbaru',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // SizedBox memberikan jarak
                                SizedBox(height: 3),

                                // Text keterangan harga pada banner
                                Text(
                                  'Mulai dari Rp850.000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SizedBox memberikan jarak
                    SizedBox(height: 25),

                    // Text bagian kategori
                    Text(
                      'Kategori',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // SizedBox memberikan jarak
                    SizedBox(height: 15),

                    // Row untuk menyusun kategori secara horizontal
                    Row(
                      children: [
                        // Expanded membuat ukuran kategori seimbang
                        Expanded(
                          // Container kategori jam pria
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.watch, size: 30, color: Colors.brown),
                                SizedBox(height: 8),
                                Text('Pria', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          // Container kategori jam wanita
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.watch, size: 30, color: Colors.brown),
                                SizedBox(height: 8),
                                Text('Wanita', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          // Container kategori jam sport
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.timer, size: 30, color: Colors.brown),
                                SizedBox(height: 8),
                                Text('Sport', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // SizedBox memberikan jarak
                    SizedBox(height: 25),

                    // Text bagian katalog
                    Text(
                      'Katalog Jam Tangan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // SizedBox memberikan jarak
                    SizedBox(height: 15),

                    // ListView.separated untuk menampilkan daftar produk secara dinamis dari Provider
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: visibleProducts.length,
                      separatorBuilder: (context, index) => SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final product = visibleProducts[index];

                        // GestureDetector membuat card produk bisa ditekan untuk melihat detail
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push membuka DetailPage dengan mengirim data produk terpilih
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(product: product),
                              ),
                            );
                          },

                          // Container card jam tangan
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            // Row menyusun gambar dan informasi jam
                            child: Row(
                              children: [
                                // Container sebagai bingkai gambar jam
                                Container(
                                  width: 75,
                                  height: 75,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.brown.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  // Image.asset menampilkan foto jam dari folder assets
                                  child: Image.asset(
                                    product.gambar,
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                SizedBox(width: 15),

                                // Expanded membuat informasi mengisi ruang yang tersisa
                                Expanded(
                                  // Column menyusun nama, harga, dan stok
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text nama jam
                                      Text(
                                        product.nama,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Text harga jam
                                      Text(
                                        product.hargaStr,
                                        style: TextStyle(
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      // Text info sisa stok produk secara real-time
                                      Text(
                                        'Stok: ${product.stock} | ${product.deskripsi}',
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
                        );
                      },
                    ),

                    // SizedBox memberikan jarak di bagian bawah
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
