class Product {
  final String id;
  final String nama;
  final int harga;
  final String hargaStr; // Tambahan properti string harga
  final String gambar;   // Tambahan properti gambar
  final String deskripsi;
  final String bahan;    // Tambahan properti bahan
  final int stock;       // Tambahan properti stock

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.hargaStr,
    required this.gambar,
    required this.deskripsi,
    required this.bahan,
    required this.stock,
  });
}