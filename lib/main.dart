// lib/main.dart
import 'package:flutter/material.dart';
import 'app/frame9.dart'; // Frame9 widget'ını import ediyoruz
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Frame9(), // Ana sayfa olarak Frame9'u kullanıyoruz
    );
  }
}
