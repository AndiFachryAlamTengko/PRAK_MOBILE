import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

// DetailPage: halaman detail produk dengan state lokal untuk TextField jumlah
class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Controller untuk mengambil teks masukan jumlah pembelian
  final TextEditingController _qtyController = TextEditingController(text: '1');

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur dasar halaman detail
    return Scaffold(
      backgroundColor: Colors.white,

      // Stack menumpuk isi halaman dengan bar harga di bagian bawah
      body: Stack(
        children: [
          // SingleChildScrollView agar isi halaman bisa di-scroll
          SingleChildScrollView(
            // Column menyusun gambar dan informasi secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stack untuk gambar jam dan tombol kembali di atasnya
                Stack(
                  children: [
                    // Image.asset menampilkan foto jam ukuran besar
                    Image.asset(
                      widget.product.gambar,
                      width: double.infinity,
                      height: 320,
                      fit: BoxFit.cover,
                    ),

                    // Positioned menaruh tombol kembali di pojok kiri atas
                    Positioned(
                      top: 40,
                      left: 20,

                      // GestureDetector agar lingkaran ini bisa ditekan
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.pop kembali ke halaman sebelumnya
                          Navigator.pop(context);
                        },

                        // Container berbentuk lingkaran untuk tombol kembali
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),

                          // Icon panah kembali
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Padding memberi jarak untuk bagian informasi
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),

                  // Column menyusun informasi produk
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text nama jam
                      Text(
                        widget.product.nama,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      // Text deskripsi singkat
                      Text(
                        widget.product.deskripsi,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Container untuk kotak spesifikasi
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // Column menyusun baris spesifikasi
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.watch, size: 20, color: Colors.brown),
                                SizedBox(width: 10),
                                Expanded(child: Text('Bahan tali')),
                                Text(
                                  widget.product.bahan,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.verified, size: 20, color: Colors.brown),
                                SizedBox(width: 10),
                                Expanded(child: Text('Garansi')),
                                Text('1 tahun', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.inventory, size: 20, color: Colors.brown),
                                SizedBox(width: 10),
                                Expanded(child: Text('Sisa Stok')),
                                Text('${widget.product.stock}', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      // Text label jumlah
                      Text(
                        'Jumlah Pembelian',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),

                      // Container pembungkus TextField jumlah
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // TextField jumlah dengan controller
                        child: TextField(
                          controller: _qtyController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText: 'Masukkan jumlah (contoh: 1)',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Positioned menempelkan bar harga di bagian bawah layar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,

            // Container bar harga dan aksi keranjang
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),

              // Row menyusun harga dan tombol secara horizontal
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Harga', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text(
                        widget.product.hargaStr,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),

                  // Expanded membuat tombol mengisi sisa lebar
                  Expanded(
                    // GestureDetector untuk tombol Masukkan Keranjang
                    child: GestureDetector(
                      onTap: () {
                        int qty = int.tryParse(_qtyController.text) ?? 1;
                        if (qty > widget.product.stock) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Jumlah melebihi stok yang tersedia!')),
                          );
                          return;
                        }

                        // Menggunakan context.read untuk memanggil fungsi provider tanpa mendengarkan perubahan terus menerus
                        context.read<CartProvider>().addToCart(widget.product, qty);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${widget.product.nama} berhasil dimasukkan ke keranjang!')),
                        );

                        Navigator.pop(context);
                      },

                      // Container tombol berwarna coklat
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        // Row menyusun icon dan tulisan tombol
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart, size: 18, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Masukkan Keranjang',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}