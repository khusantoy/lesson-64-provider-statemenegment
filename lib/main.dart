import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/utils/styles.dart';
import 'package:lesson_64_provider_statemenegment/views/screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const ProductsScreen(),
    );
  }
}
