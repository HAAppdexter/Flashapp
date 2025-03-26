import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class FlashApp extends StatelessWidget {
  const FlashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash App',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
          background: Colors.grey[900]!,
        ),
      ),
      home: const HomeScreen(),
    );
  }
} 