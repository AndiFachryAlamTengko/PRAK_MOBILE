// Diimpor untuk kebutuhan widget material Flutter
import 'package:flutter/material.dart';
// Karena main_page.dart berada di dalam folder views, file halaman lain 
// di folder yang sama dapat diimpor secara langsung
import 'home_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

// MainPage bertipe StatefulWidget untuk mengelola state halaman aktif pada BottomNavigationBar
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Indeks untuk melacak halaman yang sedang aktif di navigasi bawah
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan sesuai dengan tab navigasi
  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman berdasarkan indeks yang sedang dipilih
      body: _pages[_currentIndex],
      // BottomNavigationBar untuk navigasi antar halaman (Katalog, Keranjang, Profil)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), 
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), 
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}