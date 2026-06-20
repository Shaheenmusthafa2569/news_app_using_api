import 'package:flutter/material.dart';
import 'package:news_app_using_api/services/api_service.dart';
import 'package:news_app_using_api/theme/app_colors.dart';

class MynewsHomepage extends StatefulWidget {
  const MynewsHomepage({super.key});

  @override
  State<MynewsHomepage> createState() => _MynewsHomepageState();
}

class _MynewsHomepageState extends State<MynewsHomepage> {
  bool isLoading=true;
  ApiService apiService = ApiService();
Future<void> fetchArticle ()async{
  try{
    await apiService.getArticles();
  }catch(e){
    print(e);
  }
  setState(() {
    isLoading = false;
  });
}
  @override
  void initState(){
    super.initState();
    fetchArticle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DailyArticles"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisExtent: 5,
        ),
        itemBuilder: (context, index) {
          return NewsArticleCard(
            title: api.,
            description: description,
            source: source,
            publishedAt: publishedAt,
          );
        },
      ),
    );
  }
}
