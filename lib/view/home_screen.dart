import 'package:flutter/material.dart';
import 'package:news_app_using_api/providers/news_provider.dart';
import 'package:news_app_using_api/theme/app_colors.dart';
import 'package:news_app_using_api/view/details_screen.dart';
import 'package:news_app_using_api/widgets/alertbox.dart';
import 'package:provider/provider.dart';

class MynewsHomepage extends StatefulWidget {
  const MynewsHomepage({super.key});

  @override
  State<MynewsHomepage> createState() => _MynewsHomepageState();
}

class _MynewsHomepageState extends State<MynewsHomepage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NewsProvider>().fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DailyArticles"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final query = await showNewsSearchDialog(context);

              if (query != null && query.isNotEmpty) {
                context.read<NewsProvider>().fetchSearchNews(query);
              }
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error.isNotEmpty) {
            return Center(
              child: Text(
                "Error: ${provider.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (provider.newslist.isEmpty) {
            return const Center(
              child: Text("No articles found for this topic."),
            );
          }
          return ListView.builder(
            itemCount: provider.newslist.length,
            itemBuilder: (context, index) {
              final article = provider.newslist[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsArticleCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MyNewsDetailPage(article: article),
                      ),
                    );
                  },
                  imageUrl: article.urlToImage,
                  title: article.title,
                  description: article.description,
                  source: article.name,
                  publishedAt: article.timeAgo,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
