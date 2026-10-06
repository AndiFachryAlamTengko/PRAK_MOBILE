import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

// CartPage: halaman keranjang dengan state global Provider
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer mendengarkan perubahan data keranjang secara reaktif dari CartProvider[cite: 7]
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final cartEntries = cartProvider.cartQuantities.entries.toList();

        // Scaffold sebagai struktur dasar halaman keranjang
        return Scaffold(
          backgroundColor: Colors.white,

          // SafeArea agar isi tidak tertutup status bar
          body: SafeArea(
            // Stack menumpuk daftar keranjang dengan bar total di bawahnya
            child: Stack(
              children: [
                // SingleChildScrollView agar daftar bisa di-scroll
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),

                  // Column menyusun daftar item di keranjang
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text judul halaman keranjang
                      Text(
                        'Keranjang Belanja',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),

                      // Jika keranjang kosong
                      cartEntries.isEmpty
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 50),
                                child: Text(
                                  'Keranjang masih kosong',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartEntries.length,
                              separatorBuilder: (context, index) => SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final entry = cartEntries[index];
                                final product = cartProvider.products.firstWhere((p) => p.id == entry.key);
                                final int quantity = entry.value;

                                // Container item keranjang
                                return Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  // Row menyusun gambar, info, dan pengubah kuantitas
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 90,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          color: Colors.brown.shade50,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Image.asset(
                                          product.gambar,
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(product.nama, style: TextStyle(fontWeight: FontWeight.bold)),
                                            SizedBox(height: 3),
                                            Text(product.deskripsi, style: TextStyle(fontSize: 11, color: Colors.grey)),
                                            SizedBox(height: 3),
                                            Text(product.hargaStr, style: TextStyle(fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ),

                                      // Widget interaktif untuk mengubah kuantitas item di keranjang
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.remove_circle_outline, size: 20),
                                            onPressed: () {
                                              cartProvider.updateCartItemQuantity(product, quantity - 1);
                                            },
                                          ),
                                          Text('$quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                                          IconButton(
                                            icon: const Icon(Icons.add_circle_outline, size: 20),
                                            onPressed: () {
                                              cartProvider.updateCartItemQuantity(product, quantity + 1);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                ),

                // Positioned menempelkan bar total di bagian bawah Stack
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,

                  // Container bar total
                  child: Container(
                    padding: const EdgeInsets.all(15),
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

                    // Row menyusun total harga dan tombol checkout
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            Text(
                              'Rp${cartProvider.grandTotal}',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),

                        // Expanded agar tombol mengisi sisa lebar
                        Expanded(
                          // Container tombol checkout
                          child: GestureDetector(
                            onTap: cartEntries.isEmpty
                                ? null
                                : () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Checkout berhasil! Terima kasih.')),
                                    );
                                  },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: cartEntries.isEmpty ? Colors.grey : Colors.brown,
                                borderRadius: BorderRadius.circular(8),
                              ),

                              // Row menyusun icon dan tulisan tombol
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_cart, size: 16, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    'Checkout',
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
          ),
        );
      },
    );
  }
}