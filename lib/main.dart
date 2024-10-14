import 'package:flutter/material.dart';
import 'package:gobank/provider/category_provider.dart';
import 'package:gobank/view/splashscreen.dart';
import 'package:gobank/view/utils/colornotifire.dart';
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
        primaryColor: Color(0xffF7F7F9),
        colorScheme: const ColorScheme.light().copyWith(
          primary: Color(0xffF7F7F9),
        ),
      ),
    );
  }
}
