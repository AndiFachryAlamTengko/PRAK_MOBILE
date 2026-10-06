import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

// ProfilePage: halaman profil dengan data dinamis dari CartProvider
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data total item keranjang menggunakan Consumer agar profil terupdate otomatis
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        // Scaffold sebagai struktur dasar halaman profil
        return Scaffold(
          backgroundColor: Colors.white,

          // SingleChildScrollView agar halaman bisa di-scroll
          body: SingleChildScrollView(
            // Column menyusun header dan informasi profil
            child: Column(
              children: [
                // Stack menumpuk avatar di atas latar header
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170,
                      color: Colors.brown,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60, left: 20),
                        child: Text(
                          'Profil Saya',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: -40,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade100,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 55),

                // Padding memberi jarak isi dari sisi layar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  // Column menyusun nama dan kotak informasi
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Andi Fachry Alam Tengko',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Pelanggan Watch Catalog',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 25),

                      // Container kotak informasi akun
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),

                        // Column menyusun baris-baris informasi
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.brown),
                                SizedBox(width: 12),
                                Expanded(child: Text('Samarinda, Kalimantan Timur')),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.favorite, color: Colors.brown),
                                SizedBox(width: 12),
                                Expanded(child: Text('Suka jam tangan klasik')),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.shopping_bag, color: Colors.brown),
                                SizedBox(width: 12),
                                Expanded(
                                  // Menampilkan total barang di keranjang secara dinamis dari Provider
                                  child: Text('${cartProvider.totalCartItems} barang di keranjang'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}