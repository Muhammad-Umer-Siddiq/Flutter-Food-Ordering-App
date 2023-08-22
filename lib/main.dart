import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        listTileTheme: const ListTileThemeData(
            leadingAndTrailingTextStyle:
                TextStyle(color: Colors.black, fontSize: 18),
            titleTextStyle: TextStyle(fontSize: 18, color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade700),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
