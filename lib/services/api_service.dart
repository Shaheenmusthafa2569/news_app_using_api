// f7f817b5e18045b3879b4aacecf4579d
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_using_api/model/news_model.dart';

class ApiService {
  Future<List<NewsModel>> getArticles() async {
    final response = await http.get(
      Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=f7f817b5e18045b3879b4aacecf4579d",
      ),
    );

    if (response.statusCode == 200) {
      final decodedCode = jsonDecode(response.body);
      final List articles = decodedCode['articles'];
      return articles.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception("Try again");
    }
  }

  Future<List<NewsModel>> searchArticles(String query) async {
    final response = await http.get(
      Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&from=2026-06-23&sortBy=popularity&apiKey=f7f817b5e18045b3879b4aacecf4579d",
      ),
    );
    if (response.statusCode == 200) {
      final decodedCode = jsonDecode(response.body);
      final List articles = decodedCode['articles'];
      return articles.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception("Try again");
    }
  }
}
