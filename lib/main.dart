import 'package:flutter/material.dart';
import 'package:gobank/splashscreen.dart';
import 'package:gobank/utils/colornotifire.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorNotifire(),
        ),
      ],
      child: MaterialApp(
        home: const Splashscreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.white,
          ),
        ),
      ),
    ),
  );
}
