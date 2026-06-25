import 'package:flutter/material.dart';
import 'package:news_app_using_api/providers/news_provider.dart';
import 'package:news_app_using_api/theme/app_colors.dart';
import 'package:news_app_using_api/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: NewsTheme.light,
      darkTheme: NewsTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: MyNewsSplash(),
    );
  }
}
