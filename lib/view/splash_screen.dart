import 'package:flutter/material.dart';
import 'package:news_app_using_api/view/home_screen.dart';

class MyNewsSplash extends StatefulWidget {
  const MyNewsSplash({super.key});

  @override
  State<MyNewsSplash> createState() => _MyNewsSplashState();
}

class _MyNewsSplashState extends State<MyNewsSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MynewsHomepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: NewsColors.bgLight,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(
             "assets/newspaper.png"
              ,fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            Text(
              "DailyArticles",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LinearProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
