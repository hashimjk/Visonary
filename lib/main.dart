import 'package:flutter/material.dart';
import 'package:visionary/feature/prompt/ui/generate_Image_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.black26,
        appBarTheme: AppBarTheme(backgroundColor: Colors.black26),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: GenerateImagePage(),
    );
  }
}
