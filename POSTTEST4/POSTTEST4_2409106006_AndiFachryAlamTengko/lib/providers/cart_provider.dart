import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  // Daftar dummy produk jam tangan
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Classic Leather Watch',
      price: 1250000,
      image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      stock: 5,
      description: 'Jam tangan klasik dengan tali kulit asli yang elegan.',
    ),
    Product(
      id: '2',
      name: 'Sport Chronograph',
      price: 2100000,
      image: 'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9',
      stock: 3,
      description: 'Jam tangan sport tahan air dengan fitur chronograph.',
    ),
    Product(
      id: '3',
      name: 'Minimalist Steel',
      price: 1750000,
      image: 'https://images.unsplash.com/photo-1533139502658-0198f920d8e8',
      stock: 4,
      description: 'Desain minimalis modern dengan material stainless steel.',
    ),
  ];

  List<Product> get products => _products;

  // Menyimpan jumlah kuantitas produk di keranjang berdasarkan ID produk[cite: 3, 5]
  final Map<String, int> _cartQuantities = {};
  Map<String, int> get cartQuantities => _cartQuantities;

  // Getter untuk menghitung total harga keseluruhan di keranjang[cite: 5]
  double get grandTotal {
    double total = 0;
    _products.forEach((product) {
      final qty = _cartQuantities[product.id] ?? 0;
      total += product.price * qty;
    });
    return total;
  }

  // Fungsi untuk menambahkan produk ke keranjang[cite: 3, 5]
  void addToCart(Product product) {
    if (product.stock <= 0) return;
    product.stock--; // Mengurangi stok produk[cite: 3, 5]
    _cartQuantities[product.id] = (_cartQuantities[product.id] ?? 0) + 1; // Menambah jumlah di keranjang[cite: 3, 5]
    notifyListeners(); // Memberi tahu widget yang mendengarkan agar melakukan rebuild[cite: 3, 5]
  }

  // Fungsi untuk mengurangi atau menghapus item dari keranjang
  void removeFromCart(Product product) {
    if (!_cartQuantities.containsKey(product.id)) return;
    
    if (_cartQuantities[product.id]! > 1) {
      _cartQuantities[product.id] = _cartQuantities[product.id]! - 1;
    } else {
      _cartQuantities.remove(product.id);
    }
    product.stock++; // Mengembalikan stok produk
    notifyListeners();
  }
}