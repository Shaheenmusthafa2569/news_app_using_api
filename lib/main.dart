import 'package:flutter/material.dart';
import 'package:news_app_using_api/theme/app_colors.dart';
import 'package:news_app_using_api/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: NewsTheme.dark,
      debugShowCheckedModeBanner: false,
      home: MyNewsSplash(),
    );
  }
}
