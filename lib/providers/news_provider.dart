import 'package:flutter/material.dart';
import 'package:news_app_using_api/model/news_model.dart';
import 'package:news_app_using_api/services/api_service.dart';

class NewsProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<NewsModel> newslist = [];
  bool isLoading = false;
  List<NewsModel> filteredNews = [];
  String error = '';
  Future<void> fetchNews() async {
    try {
      isLoading = true;
      notifyListeners();
      newslist = (await apiService.getArticles());
      filteredNews = newslist;
      error = '';
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;

    notifyListeners();
  }

  void searchNews(String query) {
    if (query.isEmpty) {
      filteredNews = newslist;
    } else {
      filteredNews = newslist.where((article) {
        return article.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }
}
