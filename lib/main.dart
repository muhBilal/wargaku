import 'package:flutter/material.dart';
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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.white,
        primaryColor: const Color(0xffF7F7F9),
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xffF7F7F9),
        ),
      ),
    );
  }
}
