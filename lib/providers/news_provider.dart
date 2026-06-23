import 'package:flutter/material.dart';
import 'package:news_app_using_api/model/news_model.dart';
import 'package:news_app_using_api/services/api_service.dart';

class NewsProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<NewsModel> newslist = [];
  bool isLoading = false;
  String error = '';
  Future<void> fetchNews() async {
    try {
      isLoading = true;
      notifyListeners();
      newslist = (await apiService.getArticles()) as List<NewsModel>;
      error = '';
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
