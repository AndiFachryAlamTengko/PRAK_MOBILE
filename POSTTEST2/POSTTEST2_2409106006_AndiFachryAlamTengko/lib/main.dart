import 'package:flutter/material.dart';
// services.dart dipakai untuk membatasi input TextField (hanya angka)
import 'package:flutter/services.dart';

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

      // Halaman pertama adalah MainPage yang memiliki Navigation Bar
      home: const MainPage(),
    );
  }
}

// =====================================================
// MainPage: halaman induk yang memegang Navigation Bar
// =====================================================
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Menyimpan menu yang sedang dipilih (0 = Beranda)
  int _selectedIndex = 0;

  // Daftar halaman sesuai urutan menu di Navigation Bar
  final List<Widget> _pages = const [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman
    return Scaffold(
      // Body menampilkan halaman sesuai menu yang dipilih
      body: _pages[_selectedIndex],

      // BottomNavigationBar adalah Navigation Bar di bagian bawah layar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,

        // Saat menu ditekan, halaman diganti lewat setState
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        items: const [
          // Menu pertama: Beranda
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          // Menu kedua: Keranjang
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          // Menu ketiga: Profil
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HomePage: halaman utama katalog jam tangan
// =====================================================
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

                        // Column menyusun icon dan text secara vertikal
                        child: Column(
                          children: [
                            // Icon kategori jam pria
                            Icon(
                              Icons.watch,
                              size: 30,
                              color: Colors.brown,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 8),

                            // Text nama kategori
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

                    // SizedBox memberikan jarak antar kategori
                    SizedBox(width: 10),

                    // Expanded untuk kategori wanita
                    Expanded(
                      // Container kategori jam wanita
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // Column menyusun icon dan text
                        child: Column(
                          children: [
                            // Icon kategori jam wanita
                            Icon(
                              Icons.watch,
                              size: 30,
                              color: Colors.brown,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 8),

                            // Text nama kategori
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

                    // SizedBox memberikan jarak antar kategori
                    SizedBox(width: 10),

                    // Expanded untuk kategori sport
                    Expanded(
                      // Container kategori jam sport
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // Column menyusun icon dan text
                        child: Column(
                          children: [
                            // Icon kategori jam sport
                            Icon(
                              Icons.timer,
                              size: 30,
                              color: Colors.brown,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 8),

                            // Text nama kategori
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

                // GestureDetector membuat card pertama bisa ditekan
                GestureDetector(
                  onTap: () {
                    // Navigator.push membuka DetailPage di atas halaman ini
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(
                          nama: 'Classic Leather',
                          harga: 'Rp850.000',
                          deskripsi: 'Jam tangan klasik',
                          gambar: 'assets/classicleather.JPG',
                          bahan: 'Kulit asli',
                        ),
                      ),
                    );
                  },

                  // Container card jam tangan pertama
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      // Border untuk membuat garis pada card
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),

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
                            'assets/classicleather.JPG',
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(width: 15),

                        // Expanded membuat informasi mengisi ruang yang tersisa
                        Expanded(
                          // Column menyusun nama, harga, dan deskripsi
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text nama jam
                              Text(
                                'Classic Leather',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 5),

                              // Text harga jam
                              Text(
                                'Rp850.000',
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text deskripsi jam
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
                ),

                // SizedBox memberikan jarak antar card
                SizedBox(height: 12),

                // GestureDetector membuat card kedua bisa ditekan
                GestureDetector(
                  onTap: () {
                    // Navigator.push membuka DetailPage dengan data jam kedua
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(
                          nama: 'Sport Chronograph',
                          harga: 'Rp1.250.000',
                          deskripsi: 'Jam tangan sporty',
                          gambar: 'assets/jam1.JPG',
                          bahan: 'Karet silikon',
                        ),
                      ),
                    );
                  },

                  // Container card jam tangan kedua
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
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

                          // Image.asset menampilkan foto jam kedua
                          child: Image.asset(
                            'assets/jam1.JPG',
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(width: 15),

                        // Expanded membuat informasi mengisi ruang yang tersisa
                        Expanded(
                          // Column menyusun nama, harga, dan deskripsi
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text nama jam
                              Text(
                                'Sport Chronograph',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 5),

                              // Text harga jam
                              Text(
                                'Rp1.250.000',
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text deskripsi jam
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

                        // Icon untuk menunjukkan detail
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),

                // SizedBox memberikan jarak antar card
                SizedBox(height: 12),

                // GestureDetector membuat card ketiga bisa ditekan
                GestureDetector(
                  onTap: () {
                    // Navigator.push membuka DetailPage dengan data jam ketiga
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(
                          nama: 'Elegant Silver',
                          harga: 'Rp1.500.000',
                          deskripsi: 'Jam tangan elegan',
                          gambar: 'assets/jamelegansilver.JPG',
                          bahan: 'Stainless steel',
                        ),
                      ),
                    );
                  },

                  // Container card jam tangan kedua
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
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

                          // Image.asset menampilkan foto jam ketiga
                          child: Image.asset(
                            'assets/jamelegansilver.JPG',
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(width: 15),

                        // Expanded membuat informasi mengisi ruang yang tersisa
                        Expanded(
                          // Column menyusun nama, harga, dan deskripsi
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text nama jam
                              Text(
                                'Elegant Silver',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 5),

                              // Text harga jam
                              Text(
                                'Rp1.500.000',
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text deskripsi jam
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

                        // Icon untuk menunjukkan detail
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),

                // SizedBox memberikan jarak di bagian bawah
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// DetailPage: halaman detail, dibuka lewat Navigator.push
// =====================================================
class DetailPage extends StatelessWidget {
  final String nama;
  final String harga;
  final String deskripsi;
  final String gambar;
  final String bahan;

  const DetailPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
    required this.bahan,
  });

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
                      gambar,
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
                  // Bagian bawah dibuat besar agar tidak tertutup bar harga
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),

                  // Column menyusun informasi produk
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Text nama jam
                      Text(
                        nama,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // SizedBox memberikan jarak
                      SizedBox(height: 5),

                      // Text deskripsi singkat
                      Text(
                        deskripsi,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      // SizedBox memberikan jarak
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

                            // Row bahan tali
                            Row(
                              children: [
                                // Icon bahan tali
                                Icon(
                                  Icons.watch,
                                  size: 20,
                                  color: Colors.brown,
                                ),

                                // SizedBox memberikan jarak
                                SizedBox(width: 10),

                                // Expanded agar nilainya rata di sisi kanan
                                Expanded(
                                  // Text label bahan tali
                                  child: Text('Bahan tali'),
                                ),

                                // Text isi bahan tali
                                Text(
                                  bahan,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 12),

                            // Row garansi
                            Row(
                              children: [
                                // Icon garansi
                                Icon(
                                  Icons.verified,
                                  size: 20,
                                  color: Colors.brown,
                                ),

                                // SizedBox memberikan jarak
                                SizedBox(width: 10),

                                // Expanded agar nilainya rata di sisi kanan
                                Expanded(
                                  // Text label garansi
                                  child: Text('Garansi'),
                                ),

                                // Text isi garansi
                                Text(
                                  '1 tahun',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // SizedBox memberikan jarak
                      SizedBox(height: 20),

                      // Text label jumlah
                      Text(
                        'Jumlah',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // SizedBox memberikan jarak
                      SizedBox(height: 8),

                      // Container pembungkus TextField jumlah
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // TextField jumlah, hanya menerima angka
                        child: TextField(
                          // Keyboard yang muncul adalah keyboard angka
                          keyboardType: TextInputType.number,

                          // digitsOnly menolak karakter selain angka
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

            // Container bar harga
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,

                // BoxShadow memberi bayangan tipis di atas bar
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

                  // Column untuk label dan harga
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text label harga
                      Text(
                        'Harga',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),

                      // Text nilai harga
                      Text(
                        harga,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // SizedBox memberikan jarak
                  SizedBox(width: 20),

                  // Expanded membuat tombol mengisi sisa lebar
                  Expanded(
                    // GestureDetector untuk tombol Masukkan Keranjang
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.pop kembali ke katalog
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
                            // Icon keranjang pada tombol
                            Icon(
                              Icons.shopping_cart,
                              size: 18,
                              color: Colors.white,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(width: 8),

                            // Text tulisan tombol
                            Text(
                              'Masukkan Keranjang',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
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

// =====================================================
// CartPage: halaman keranjang (menu kedua Navigation Bar)
// =====================================================
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              // Padding bawah besar agar item terakhir tidak tertutup bar total
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),

              // Column menyusun pencarian dan item keranjang
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Container pembungkus TextField pencarian
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(25),
                    ),

                    // TextField untuk mencari produk di keranjang
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari',
                        border: InputBorder.none,

                        // Icon pencarian di sisi kanan TextField
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  // SizedBox memberikan jarak
                  SizedBox(height: 20),

                  // Container item keranjang pertama
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    // Row menyusun gambar, info, dan input jumlah
                    child: Row(
                      children: [

                        // Container bingkai gambar produk
                        Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.brown.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),

                          // Image.asset menampilkan foto produk
                          child: Image.asset(
                            'assets/classicleather.JPG',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(width: 12),

                        // Expanded agar info produk mengisi ruang tengah
                        Expanded(
                          // Column menyusun nama, deskripsi, dan harga
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text nama produk
                              Text(
                                'Classic Leather',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text deskripsi produk
                              Text(
                                'Jam tangan klasik',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text harga produk
                              Text(
                                'Rp850.000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // SizedBox membatasi lebar kolom input jumlah
                        SizedBox(
                          width: 50,

                          // TextField jumlah, hanya boleh angka
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: '1',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox memberikan jarak antar item
                  SizedBox(height: 12),

                  // Container item keranjang kedua
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    // Row menyusun gambar, info, dan input jumlah
                    child: Row(
                      children: [

                        // Container bingkai gambar produk
                        Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.brown.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),

                          // Image.asset menampilkan foto produk kedua
                          child: Image.asset(
                            'assets/jam1.JPG',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(width: 12),

                        // Expanded agar info produk mengisi ruang tengah
                        Expanded(
                          // Column menyusun nama, deskripsi, dan harga
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text nama produk
                              Text(
                                'Sport Chronograph',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text deskripsi produk
                              Text(
                                'Jam tangan sporty',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text harga produk
                              Text(
                                'Rp1.250.000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // SizedBox membatasi lebar kolom input jumlah
                        SizedBox(
                          width: 50,

                          // TextField jumlah, hanya boleh angka
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: '1',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox memberikan jarak antar item
                  SizedBox(height: 12),

                  // Container item keranjang ketiga
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    // Row menyusun gambar, info, dan input jumlah
                    child: Row(
                      children: [

                        // Container bingkai gambar produk
                        Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.brown.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),

                          // Image.asset menampilkan foto produk ketiga
                          child: Image.asset(
                            'assets/jamelegansilver.JPG',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(width: 12),

                        // Expanded agar info produk mengisi ruang tengah
                        Expanded(
                          // Column menyusun nama, deskripsi, dan harga
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text nama produk
                              Text(
                                'Elegant Silver',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text deskripsi produk
                              Text(
                                'Jam tangan elegan',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),

                              // SizedBox memberikan jarak
                              SizedBox(height: 3),

                              // Text harga produk
                              Text(
                                'Rp1.500.000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // SizedBox membatasi lebar kolom input jumlah
                        SizedBox(
                          width: 50,

                          // TextField jumlah, hanya boleh angka
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: '1',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
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

                  // BoxShadow memberi bayangan di sisi atas bar total
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

                    // Column untuk label dan nilai total
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text label total
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),

                        // Text nilai total
                        Text(
                          'Rp3.600.000',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // SizedBox memberikan jarak
                    SizedBox(width: 20),

                    // Expanded agar tombol mengisi sisa lebar
                    Expanded(
                      // Container tombol checkout
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(8),
                        ),

                        // Row menyusun icon dan tulisan tombol
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon keranjang pada tombol
                            Icon(
                              Icons.shopping_cart,
                              size: 16,
                              color: Colors.white,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(width: 8),

                            // Text tulisan tombol
                            Text(
                              'Checkout',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
  }
}

// =====================================================
// ProfilePage: halaman profil (menu ketiga Navigation Bar)
// =====================================================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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

                // Container sebagai latar header berwarna coklat
                Container(
                  width: double.infinity,
                  height: 170,
                  color: Colors.brown,

                  // Padding mengatur posisi judul di dalam header
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20),

                    // Text judul halaman
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

                // Positioned meletakkan avatar agar menimpa batas header
                Positioned(
                  left: 20,
                  bottom: -40,

                  // Container berbentuk lingkaran sebagai avatar
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

                    // Icon orang sebagai foto profil sementara
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ],
            ),

            // SizedBox memberikan jarak di bawah avatar
            SizedBox(height: 55),

            // Padding memberi jarak isi dari sisi layar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              // Column menyusun nama dan kotak informasi
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Text nama pengguna
                  Text(
                    'Andi Fachry Alam Tengko',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // SizedBox memberikan jarak
                  SizedBox(height: 4),

                  // Text keterangan pengguna
                  Text(
                    'Pelanggan Watch Catalog',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),

                  // SizedBox memberikan jarak
                  SizedBox(height: 25),

                  // Container kotak informasi akun
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),

                      // BoxShadow memberi sedikit bayangan pada kotak
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

                        // Row informasi alamat
                        Row(
                          children: [
                            // Icon lokasi
                            Icon(
                              Icons.location_on,
                              color: Colors.brown,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(width: 12),

                            // Expanded agar teks mengisi sisa lebar
                            Expanded(
                              // Text alamat
                              child: Text('Samarinda, Kalimantan Timur'),
                            ),
                          ],
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(height: 15),

                        // Row informasi favorit
                        Row(
                          children: [
                            // Icon favorit
                            Icon(
                              Icons.favorite,
                              color: Colors.brown,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(width: 12),

                            // Expanded agar teks mengisi sisa lebar
                            Expanded(
                              // Text favorit
                              child: Text('Suka jam tangan klasik'),
                            ),
                          ],
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(height: 15),

                        // Row informasi keranjang
                        Row(
                          children: [
                            // Icon tas belanja
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.brown,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(width: 12),

                            // Expanded agar teks mengisi sisa lebar
                            Expanded(
                              // Text jumlah barang di keranjang
                              child: Text('3 barang di keranjang'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // SizedBox memberikan jarak di bagian bawah
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}