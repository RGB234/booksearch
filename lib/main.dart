import 'package:booksearch/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // Books_Api.getSearchResults("햄스터");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
