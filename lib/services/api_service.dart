// f7f817b5e18045b3879b4aacecf4579d
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_using_api/model/news_model.dart';

class ApiService {
  Future<NewsModel> getArticles() async {
    final response = await http.get(
      Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=f7f817b5e18045b3879b4aacecf4579d",
      ),
    );
    if (response.statusCode == 200) {
      final decodedCode = jsonDecode(response.body);
      return NewsModel.fromJson(decodedCode);
    } else {
      throw Exception("Try again");
    }
  }
}
