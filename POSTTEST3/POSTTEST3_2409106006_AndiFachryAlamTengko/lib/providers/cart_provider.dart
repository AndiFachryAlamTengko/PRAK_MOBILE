import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  // Daftar produk jam tangan (katalog)
  final List<Product> _products = [
    Product(
      id: '1',
      nama: 'Classic Leather',
      harga: 1500000,
      hargaStr: 'Rp 1.500.000',
      gambar: 'assets/classicleather.JPG',
      deskripsi: 'Jam tangan kulit klasik dengan desain elegan dan tahan air.',
      bahan: 'Kulit Asli',
      stock: 10,
    ),
    Product(
      id: '2',
      nama: 'Jam Sport 1',
      harga: 1200000,
      hargaStr: 'Rp 1.200.000',
      gambar: 'assets/jam1.JPG',
      deskripsi: 'Jam tangan sport kasual cocok untuk aktivitas harian.',
      bahan: 'Rubber / Silikon',
      stock: 15,
    ),
    Product(
      id: '3',
      nama: 'Elegant Silver',
      harga: 2500000,
      hargaStr: 'Rp 2.500.000',
      gambar: 'assets/jamelegansilver.JPG',
      deskripsi: 'Jam tangan mewah berwarna silver dengan material stainless steel.',
      bahan: 'Stainless Steel',
      stock: 5,
    ),
  ];

  List<Product> get products => _products;

  // Menyimpan jumlah kuantitas per produk di keranjang (Key: productId, Value: quantity)
  final Map<String, int> _cartQuantities = {};
  Map<String, int> get cartQuantities => _cartQuantities;

  // Query pencarian untuk filter produk
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // Menambahkan produk ke keranjang
  void addToCart(Product product, int qty) {
    if (_cartQuantities.containsKey(product.id)) {
      _cartQuantities[product.id] = (_cartQuantities[product.id]! + qty);
    } else {
      _cartQuantities[product.id] = qty;
    }
    notifyListeners();
  }

  // Mengubah kuantitas item di keranjang
  void updateCartItemQuantity(Product product, int newQty) {
    if (newQty <= 0) {
      _cartQuantities.remove(product.id);
    } else {
      _cartQuantities[product.id] = newQty;
    }
    notifyListeners();
  }

  // Total item di keranjang
  int get totalCartItems {
    return _cartQuantities.values.fold(0, (sum, qty) => sum + qty);
  }

  // Total harga keseluruhan di keranjang
  int get grandTotal {
    int total = 0;
    _cartQuantities.forEach((productId, qty) {
      final product = _products.firstWhere((p) => p.id == productId);
      total += product.harga * qty;
    });
    return total;
  }
}