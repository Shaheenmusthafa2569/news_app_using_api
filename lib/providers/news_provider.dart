import 'package:flutter/material.dart';
import 'package:news_app_using_api/model/news_model.dart';
import 'package:news_app_using_api/services/api_service.dart';

class NewsProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<NewsModel> newslist = [];
  bool isLoading = false;
  String error = '';

  // Fetch top headlines
  Future<void> fetchNews() async {
    try {
      isLoading = true;
      error = '';
      notifyListeners();
      
      newslist = await apiService.getArticles();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Fetch search results from API
  Future<void> fetchSearchNews(String query) async {
    if (query.isEmpty) return;
    
    try {
      isLoading = true;
      error = '';
      notifyListeners();
      
      // Update the main list with live search engine results
      newslist = await apiService.searchArticles(query);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}