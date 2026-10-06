// Diimpor untuk kebutuhan widget material Flutter dan state management Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'views/main_page.dart';

// Fungsi utama aplikasi yang pertama kali dijalankan oleh sistem Flutter
void main() {
  runApp(const MyApp());
}

// Widget utama (Root Widget) yang mendeklarasikan MultiProvider untuk state global
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan MultiProvider agar CartProvider dapat diakses dari halaman manapun
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Watch Catalog',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: const Color(0xFFF5F5F3),
        ),
        // Halaman awal aplikasi mengarah ke MainPage (navigasi bottom bar)
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}