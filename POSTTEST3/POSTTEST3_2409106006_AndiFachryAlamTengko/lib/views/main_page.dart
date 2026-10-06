import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

// MainPage: halaman induk yang memegang Navigation Bar (StatefulWidget)
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