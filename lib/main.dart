import 'package:flutter/material.dart';
import 'package:wargaku/provider/auth/auth_provider.dart';
import 'package:wargaku/provider/auth/kecamatan_provider.dart';
import 'package:wargaku/provider/category_provider.dart';
import 'package:wargaku/view/splashscreen.dart';
import 'package:wargaku/view/utils/colornotifire.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifire()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => KecamatanProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffF7F7F9),
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xffF7F7F9),
        ),
      ),
    );
  }
}
